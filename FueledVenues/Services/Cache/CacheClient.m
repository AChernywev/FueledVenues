//
//  DatabaseClient.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "CacheClient.h"

#import "NSDictionary+SafeParsing.h"

@interface CacheClient()
@property (nonatomic, readonly) NSString *  cacheName;
@property (nonatomic, readonly) NSURL *     cacheURL;

@property (nonatomic, strong) NSManagedObjectContext *      mainObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *        managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation CacheClient

#pragma mark - initialization
- (instancetype)initWithCacheName:(NSString *)cacheName url:(NSURL *)cacheURL
{
    self = [super init];
    if(self) {
        _cacheName = [cacheName copy];
        _cacheURL = cacheURL;
    }
    return self;
}

- (instancetype)init
{
    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
    NSString *cacheName = [infoDict stringAtKey:@"CFBundleName"];
    NSURL *cacheURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    cacheURL = [[cacheURL URLByAppendingPathComponent:cacheName] URLByAppendingPathExtension:@"sqlite"];
    return [self initWithCacheName:cacheName url:cacheURL];
}

#pragma mark - public methods
- (void)deleteObject:(NSManagedObject *)mObject
{
    if(mObject) {
        [self.mainObjectContext performBlock:^{
            [self.mainObjectContext deleteObject:mObject];
            [self saveOnBlockSafely];
        }];
    }
}

- (void)deleteObjects:(NSArray *)items
{
    [self.mainObjectContext performBlock:^{
        for(NSManagedObject *mObject in items) {
            [self.mainObjectContext deleteObject:mObject];
        }
        [self saveOnBlockSafely];
    }];
}

- (NSManagedObject *)getEntityWithTemplate:(NSString *)name variables:(NSDictionary *)variables
{
    return [self getEntityWithRequest:[self requestFromTemplateWithName:name variables:variables]];
}

- (NSArray *)getEntitiesWithTemplate:(NSString *)name variables:(NSDictionary *)variables
{
    return [self getEntitiesWithRequest:[self requestFromTemplateWithName:name variables:variables]];
}

- (NSManagedObject *)getEntityWithRequest:(NSFetchRequest *)request
{
    NSArray *items = [self getEntitiesWithRequest:request];
    if (items.count > 0) {
        return [items lastObject];
    }
    else {
        return nil;
    }
}

- (NSArray *)getEntitiesWithRequest:(NSFetchRequest *)request
{
    if(request) {
        __block NSArray *resultItems = nil;
        [self.mainObjectContext performBlockAndWait:^{
            NSError *error = nil;
            resultItems = [self.mainObjectContext executeFetchRequest:request error:&error];
            if(error) {
                NSLog(@"database fetch error [%@]: %@", @(error.code).stringValue, error.localizedDescription);
            }
        }];
        return resultItems;
    }
    else {
        return nil;
    }
}

- (id)createObjectWithType:(Class)aClass
{
    __block NSManagedObject *createdObject = nil;
    [self.mainObjectContext performBlockAndWait:^{
        createdObject = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(aClass)
                                                      inManagedObjectContext:self. mainObjectContext];
        [self saveOnBlockSafely];
    }];
    return createdObject;
}

- (NSArray *)objectsWithType:(Class)aClass
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass(aClass)];
    return [self getEntitiesWithRequest:request];
}

- (void)saveDatabase
{
    [self.mainObjectContext performBlock:^{
        [self saveOnBlockSafely];
    }];
}

#pragma mark - private methods
- (NSFetchRequest *)requestFromTemplateWithName:(NSString *)templateName variables:(NSDictionary *)variables
{
    NSFetchRequest *request = nil;
    if (variables.count) {
        request = [self.managedObjectModel fetchRequestFromTemplateWithName:templateName substitutionVariables:variables];
    }
    else {
        request = [self.managedObjectModel fetchRequestTemplateForName:templateName];
    }
    return request;
}

- (NSManagedObjectContext *)createContext
{
    NSManagedObjectContext *context = nil;
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [context setPersistentStoreCoordinator:coordinator];
    }
    return context;
}

- (void)saveOnBlockSafely
{
    if (self.mainObjectContext != nil && [self.mainObjectContext hasChanges]) {
        NSError *error = nil;
        if(![self.mainObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved save error %@, %@", error, [error userInfo]);
        }
    }
}

#pragma mark - Core Data stack
- (NSManagedObjectContext *)mainObjectContext
{
    if(!_mainObjectContext) {
        _mainObjectContext = [self createContext];
    }
    return _mainObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if(!_managedObjectModel) {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:self.cacheName withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (!_persistentStoreCoordinator) {
        
        #warning CHECK THIS SHIT MZFCR!!!
        NSError *error = nil;
        NSDictionary *options = @{
                                  NSMigratePersistentStoresAutomaticallyOption : @(YES),
                                  NSInferMappingModelAutomaticallyOption       : @(YES)
                                  };
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                       configuration:nil
                                                                 URL:self.cacheURL
                                                             options:options
                                                               error:&error])
        {
            NSError *deleteError = nil;
            [[NSFileManager defaultManager] removeItemAtURL:self.cacheURL error:&deleteError];
            _mainObjectContext = nil;
            _persistentStoreCoordinator = nil;
            _managedObjectModel = nil;
            [self mainObjectContext];
            return [self persistentStoreCoordinator];
        }
    }
    return _persistentStoreCoordinator;
}

@end
