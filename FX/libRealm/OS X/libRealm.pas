//  Import of libRealm ()
//  Frameworks:
//  Targets: x86_64
//  Dep fx:rtl, Foundation
//  Dep libs:Realm, tightdb-dbg, c++
namespace ;

interface

type
  Realm.RLMObjectBase = public class(NSObject)
  public
    property realm: Realm.RLMRealm read;
    property objectSchema: id read;
    property invalidated: BOOL read;
    method init: instancetype;
    method initWithObject(object: id): instancetype;
    method initWithObject(value: id) schema(schema: id): instancetype;
    method initWithObjectSchema(schema: id): instancetype;
    method isEqualToObject(object: Realm.RLMObjectBase): BOOL;
    method linkingObjectsOfClass(className: NSString) forProperty(&property: NSString): NSArray;
    method objectForKeyedSubscript(key: NSString): id;
    method setObject(obj: id) forKeyedSubscript(key: NSString);
    class method className: NSString;
    class method defaultPropertyValues: NSDictionary;
    class method primaryKey: NSString;
    class method ignoredProperties: NSArray;
  end;

  Realm.RLMObject = public class(Realm.RLMObjectBase)
  public
    method init: instancetype;
    method initWithObject(object: id): instancetype;
    class method className: NSString;
    class method createInDefaultRealmWithObject(object: id): instancetype;
    class method createInRealm(realm: Realm.RLMRealm) withObject(object: id): instancetype;
    class method createOrUpdateInDefaultRealmWithObject(object: id): instancetype;
    class method createOrUpdateInRealm(realm: Realm.RLMRealm) withObject(object: id): instancetype;
    property realm: Realm.RLMRealm read;
    property objectSchema: id read;
    property invalidated: BOOL read;
    property deletedFromRealm: BOOL read;
    class method indexedProperties: NSArray;
    class method defaultPropertyValues: NSDictionary;
    class method primaryKey: NSString;
    class method ignoredProperties: NSArray;
    class method allObjects: id;
    class method objectsWhere(predicateFormat: NSString; params Param1: Void): id;
    class method objectsWithPredicate(predicate: NSPredicate): id;
    class method objectForPrimaryKey(primaryKey: id): instancetype;
    class method allObjectsInRealm(realm: Realm.RLMRealm): id;
    class method objectsInRealm(realm: Realm.RLMRealm) &where(predicateFormat: NSString; params Param2: Void): id;
    class method objectsInRealm(realm: Realm.RLMRealm) withPredicate(predicate: NSPredicate): id;
    class method objectInRealm(realm: Realm.RLMRealm) forPrimaryKey(primaryKey: id): instancetype;
    method linkingObjectsOfClass(className: NSString) forProperty(&property: NSString): NSArray;
    method isEqualToObject(object: Realm.RLMObject): BOOL;
    method objectForKeyedSubscript(key: NSString): id;
    method setObject(obj: id) forKeyedSubscript(key: NSString);
  end;

  Realm.RLMNotificationBlock = public method (notification: NSString; realm: Realm.RLMRealm);

  Realm.RLMMigrationBlock = public method (migration: id; oldSchemaVersion: NSUInteger);

  Realm.RLMRealm = public class(NSObject)
  public
    class method defaultRealm: instancetype;
    class method realmWithPath(path: NSString): instancetype;
    class method realmWithPath(path: NSString) &readOnly(&readonly: BOOL) error(var error: NSError): instancetype;
    class method realmWithPath(path: NSString) encryptionKey(key: NSData) &readOnly(&readonly: BOOL) error(var error: NSError): instancetype;
    class method setEncryptionKey(key: NSData) forRealmsAtPath(path: NSString);
    class method inMemoryRealmWithIdentifier(identifier: NSString): instancetype;
    property path: NSString read;
    property &readOnly: BOOL read;
    property schema: id read;
    method addNotificationBlock(&block: Realm.RLMNotificationBlock): Realm.RLMNotificationToken;
    method removeNotification(notificationToken: Realm.RLMNotificationToken);
    method beginWriteTransaction;
    method commitWriteTransaction;
    method cancelWriteTransaction;
    method transactionWithBlock(&block: method );
    method refresh: BOOL;
    property autorefresh: BOOL read write;
    method writeCopyToPath(path: NSString) error(var error: NSError): BOOL;
    method writeCopyToPath(path: NSString) encryptionKey(key: NSData) error(var error: NSError): BOOL;
    method invalidate;
    method addObject(object: Realm.RLMObject);
    method addObjects(&array: INSFastEnumeration);
    method addOrUpdateObject(object: Realm.RLMObject);
    method addOrUpdateObjectsFromArray(&array: id);
    method deleteObject(object: Realm.RLMObject);
    method deleteObjects(&array: id);
    method deleteAllObjects;
    class method setDefaultRealmSchemaVersion(version: NSUInteger) withMigrationBlock(&block: Realm.RLMMigrationBlock);
    class method setSchemaVersion(version: NSUInteger) forRealmAtPath(realmPath: NSString) withMigrationBlock(&block: Realm.RLMMigrationBlock);
    class method schemaVersionAtPath(realmPath: NSString) error(var error: NSError): NSUInteger;
    class method schemaVersionAtPath(realmPath: NSString) encryptionKey(key: NSData) error(var error: NSError): NSUInteger;
    class method migrateRealmAtPath(realmPath: NSString): NSError;
    class method migrateRealmAtPath(realmPath: NSString) encryptionKey(key: NSData): NSError;
    class property defaultRealmPath: NSString read write;
  end;

  Realm.RLMNotificationToken = public class(NSObject);

implementation

end.
