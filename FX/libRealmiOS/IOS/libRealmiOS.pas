//  Import of libRealmiOS ()
//  Frameworks:
//  Targets: armv7, armv7s, arm64
//  Dep fx:rtl, Foundation
//  Dep libs:RealmiOS, tightdb-ios, c++
namespace ;

interface

type
  Realm.Realm.IRLMCollection = public interface
    property count: NSUInteger read;
    property objectClassName: NSString read;
    property realm: Realm.Realm.RLMRealm read;
    method objectAtIndex(&index: NSUInteger): id;
    method firstObject: id;
    method lastObject: id;
    method indexOfObject(object: Realm.Realm.RLMObject): NSUInteger;
    method indexOfObjectWhere(predicateFormat: NSString; params Param1: Void): NSUInteger;
    method indexOfObjectWithPredicate(predicate: NSPredicate): NSUInteger;
    method objectsWhere(predicateFormat: NSString; params Param1: Void): Realm.Realm.RLMResults;
    method objectsWithPredicate(predicate: NSPredicate): Realm.Realm.RLMResults;
    method sortedResultsUsingProperty(&property: NSString) ascending(ascending: BOOL): Realm.Realm.RLMResults;
    method sortedResultsUsingDescriptors(properties: NSArray): Realm.Realm.RLMResults;
    method objectAtIndexedSubscript(&index: NSUInteger): id;
  end;

  Realm.Realm.RLMArray = public class(NSObject)
  public
    property count: NSUInteger read;
    property objectClassName: NSString read;
    property realm: Realm.Realm.RLMRealm read;
    method objectAtIndex(&index: NSUInteger): id;
    method firstObject: id;
    method lastObject: id;
    method addObject(object: Realm.Realm.RLMObject);
    method addObjects(objects: INSFastEnumeration);
    method insertObject(anObject: Realm.Realm.RLMObject) atIndex(&index: NSUInteger);
    method removeObjectAtIndex(&index: NSUInteger);
    method removeLastObject;
    method removeAllObjects;
    method replaceObjectAtIndex(&index: NSUInteger) withObject(anObject: Realm.Realm.RLMObject);
    method indexOfObject(object: Realm.Realm.RLMObject): NSUInteger;
    method indexOfObjectWhere(predicateFormat: NSString; params Param1: Void): NSUInteger;
    method indexOfObjectWithPredicate(predicate: NSPredicate): NSUInteger;
    method objectsWhere(predicateFormat: NSString; params Param1: Void): Realm.Realm.RLMResults;
    method objectsWithPredicate(predicate: NSPredicate): Realm.Realm.RLMResults;
    method sortedResultsUsingProperty(&property: NSString) ascending(ascending: BOOL): Realm.Realm.RLMResults;
    method sortedResultsUsingDescriptors(properties: NSArray): Realm.Realm.RLMResults;
    method objectAtIndexedSubscript(&index: NSUInteger): id;
    method setObject(newValue: id) atIndexedSubscript(&index: NSUInteger);
    method init: instancetype;
    class method &new: instancetype;
  end;

  Realm.Realm.RLMSortDescriptor = public class(NSObject)
  public
    property &property: NSString read;
    property ascending: BOOL read;
    class method sortDescriptorWithProperty(propertyName: NSString) ascending(ascending: BOOL): instancetype;
    method reversedSortDescriptor: instancetype;
  end;

  Realm.Realm.RLMObjectMigrationBlock = public method (oldObject: Realm.Realm.RLMObject; newObject: Realm.Realm.RLMObject);

  Realm.Realm.RLMMigration = public class(NSObject)
  public
    property oldSchema: Realm.Realm.RLMSchema read;
    property newSchema: Realm.Realm.RLMSchema read;
    method enumerateObjects(className: NSString) &block(&block: Realm.Realm.RLMObjectMigrationBlock);
    method createObject(className: NSString) withObject(object: id): Realm.Realm.RLMObject;
    method deleteObject(object: Realm.Realm.RLMObject);
  end;

  Realm.Realm.RLMObjectBase = public class(NSObject)
  public
    property realm: Realm.Realm.RLMRealm read;
    property objectSchema: id read;
    property invalidated: BOOL read;
    method init: instancetype;
    method initWithObject(object: id): instancetype;
    method initWithObject(value: id) schema(schema: Realm.Realm.RLMSchema): instancetype;
    method initWithObjectSchema(schema: id): instancetype;
    method isEqualToObject(object: Realm.Realm.RLMObjectBase): BOOL;
    method linkingObjectsOfClass(className: NSString) forProperty(&property: NSString): NSArray;
    method objectForKeyedSubscript(key: NSString): id;
    method setObject(obj: id) forKeyedSubscript(key: NSString);
    class method className: NSString;
    class method defaultPropertyValues: NSDictionary;
    class method primaryKey: NSString;
    class method ignoredProperties: NSArray;
  end;

  Realm.Realm.RLMObject = public class(Realm.Realm.RLMObjectBase)
  public
    method init: instancetype;
    method initWithObject(object: id): instancetype;
    class method className: NSString;
    class method createInDefaultRealmWithObject(object: id): instancetype;
    class method createInRealm(realm: Realm.Realm.RLMRealm) withObject(object: id): instancetype;
    class method createOrUpdateInDefaultRealmWithObject(object: id): instancetype;
    class method createOrUpdateInRealm(realm: Realm.Realm.RLMRealm) withObject(object: id): instancetype;
    property realm: Realm.Realm.RLMRealm read;
    property objectSchema: id read;
    property invalidated: BOOL read;
    property deletedFromRealm: BOOL read;
    class method indexedProperties: NSArray;
    class method defaultPropertyValues: NSDictionary;
    class method primaryKey: NSString;
    class method ignoredProperties: NSArray;
    class method allObjects: Realm.Realm.RLMResults;
    class method objectsWhere(predicateFormat: NSString; params Param1: Void): Realm.Realm.RLMResults;
    class method objectsWithPredicate(predicate: NSPredicate): Realm.Realm.RLMResults;
    class method objectForPrimaryKey(primaryKey: id): instancetype;
    class method allObjectsInRealm(realm: Realm.Realm.RLMRealm): Realm.Realm.RLMResults;
    class method objectsInRealm(realm: Realm.Realm.RLMRealm) &where(predicateFormat: NSString; params Param2: Void): Realm.Realm.RLMResults;
    class method objectsInRealm(realm: Realm.Realm.RLMRealm) withPredicate(predicate: NSPredicate): Realm.Realm.RLMResults;
    class method objectInRealm(realm: Realm.Realm.RLMRealm) forPrimaryKey(primaryKey: id): instancetype;
    method linkingObjectsOfClass(className: NSString) forProperty(&property: NSString): NSArray;
    method isEqualToObject(object: Realm.Realm.RLMObject): BOOL;
    method objectForKeyedSubscript(key: NSString): id;
    method setObject(obj: id) forKeyedSubscript(key: NSString);
  end;

  Realm.Realm.RLMNotificationBlock = public method (notification: NSString; realm: Realm.Realm.RLMRealm);

  Realm.Realm.RLMMigrationBlock = public method (migration: Realm.Realm.RLMMigration; oldSchemaVersion: NSUInteger);

  Realm.Realm.RLMRealm = public class(NSObject)
  public
    class method defaultRealm: instancetype;
    class method realmWithPath(path: NSString): instancetype;
    class method realmWithPath(path: NSString) &readOnly(&readonly: BOOL) error(var error: NSError): instancetype;
    class method realmWithPath(path: NSString) encryptionKey(key: NSData) &readOnly(&readonly: BOOL) error(var error: NSError): instancetype;
    class method setEncryptionKey(key: NSData) forRealmsAtPath(path: NSString);
    class method inMemoryRealmWithIdentifier(identifier: NSString): instancetype;
    property path: NSString read;
    property &readOnly: BOOL read;
    property schema: Realm.Realm.RLMSchema read;
    method addNotificationBlock(&block: Realm.Realm.RLMNotificationBlock): Realm.Realm.RLMNotificationToken;
    method removeNotification(notificationToken: Realm.Realm.RLMNotificationToken);
    method beginWriteTransaction;
    method commitWriteTransaction;
    method cancelWriteTransaction;
    method transactionWithBlock(&block: method );
    method refresh: BOOL;
    property autorefresh: BOOL read write;
    method writeCopyToPath(path: NSString) error(var error: NSError): BOOL;
    method writeCopyToPath(path: NSString) encryptionKey(key: NSData) error(var error: NSError): BOOL;
    method invalidate;
    method addObject(object: Realm.Realm.RLMObject);
    method addObjects(&array: INSFastEnumeration);
    method addOrUpdateObject(object: Realm.Realm.RLMObject);
    method addOrUpdateObjectsFromArray(&array: id);
    method deleteObject(object: Realm.Realm.RLMObject);
    method deleteObjects(&array: id);
    method deleteAllObjects;
    class method setDefaultRealmSchemaVersion(version: NSUInteger) withMigrationBlock(&block: Realm.Realm.RLMMigrationBlock);
    class method setSchemaVersion(version: NSUInteger) forRealmAtPath(realmPath: NSString) withMigrationBlock(&block: Realm.Realm.RLMMigrationBlock);
    class method schemaVersionAtPath(realmPath: NSString) error(var error: NSError): NSUInteger;
    class method schemaVersionAtPath(realmPath: NSString) encryptionKey(key: NSData) error(var error: NSError): NSUInteger;
    class method migrateRealmAtPath(realmPath: NSString): NSError;
    class method migrateRealmAtPath(realmPath: NSString) encryptionKey(key: NSData): NSError;
    class property defaultRealmPath: NSString read write;
  end;

  Realm.Realm.RLMNotificationToken = public class(NSObject);

  Realm.Realm.RLMResults = public class(NSObject)
  public
    property count: NSUInteger read;
    property objectClassName: NSString read;
    property realm: Realm.Realm.RLMRealm read;
    method objectAtIndex(&index: NSUInteger): id;
    method firstObject: id;
    method lastObject: id;
    method indexOfObject(object: Realm.Realm.RLMObject): NSUInteger;
    method indexOfObjectWhere(predicateFormat: NSString; params Param1: Void): NSUInteger;
    method indexOfObjectWithPredicate(predicate: NSPredicate): NSUInteger;
    method objectsWhere(predicateFormat: NSString; params Param1: Void): Realm.Realm.RLMResults;
    method objectsWithPredicate(predicate: NSPredicate): Realm.Realm.RLMResults;
    method sortedResultsUsingProperty(&property: NSString) ascending(ascending: BOOL): Realm.Realm.RLMResults;
    method sortedResultsUsingDescriptors(properties: NSArray): Realm.Realm.RLMResults;
    method minOfProperty(&property: NSString): id;
    method maxOfProperty(&property: NSString): id;
    method sumOfProperty(&property: NSString): NSNumber;
    method averageOfProperty(&property: NSString): NSNumber;
    method objectAtIndexedSubscript(&index: NSUInteger): id;
    method init: instancetype;
    class method &new: instancetype;
  end;

  Realm.Realm.RLMSchema = public class(NSObject)
  public
    property objectSchema: NSArray read;
    method schemaForClassName(className: NSString): id;
    method objectForKeyedSubscript(className: INSCopying): id;
    method isEqualToSchema(schema: Realm.Realm.RLMSchema): BOOL;
  end;

implementation

end.
