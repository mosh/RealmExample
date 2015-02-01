//  Import of libRealm ()
//  Frameworks:
//  Targets: x86_64
//  Dep fx:rtl, Foundation
//  Dep libs:Realm, tightdb-dbg, c++
namespace 
{
    public class Realm.RLMObjectBase: NSObject
    {
        public Realm.RLMRealm realm { get; }
        public id objectSchema { get; }
        public BOOL invalidated { get; }
        public instancetype init();
        public instancetype initWithObject(id @object);
        public instancetype initWithObject(id @value) schema(id schema);
        public instancetype initWithObjectSchema(id schema);
        public BOOL isEqualToObject(Realm.RLMObjectBase @object);
        public NSArray linkingObjectsOfClass(NSString className) forProperty(NSString property);
        public id objectForKeyedSubscript(NSString key);
        public void setObject(id obj) forKeyedSubscript(NSString key);
        public static NSString className();
        public static NSDictionary defaultPropertyValues();
        public static NSString primaryKey();
        public static NSArray ignoredProperties();
    }

    public class Realm.RLMObject: Realm.RLMObjectBase
    {
        public instancetype init();
        public instancetype initWithObject(id @object);
        public static NSString className();
        public static instancetype createInDefaultRealmWithObject(id @object);
        public static instancetype createInRealm(Realm.RLMRealm realm) withObject(id @object);
        public static instancetype createOrUpdateInDefaultRealmWithObject(id @object);
        public static instancetype createOrUpdateInRealm(Realm.RLMRealm realm) withObject(id @object);

        public Realm.RLMRealm realm { get; }
        public id objectSchema { get; }
        public BOOL invalidated { get; }
        public BOOL deletedFromRealm { get; }
        public static NSArray indexedProperties();
        public static NSDictionary defaultPropertyValues();
        public static NSString primaryKey();
        public static NSArray ignoredProperties();
        public static id allObjects();
        public static id objectsWhere(NSString predicateFormat, params Void Param1);
        public static id objectsWithPredicate(NSPredicate predicate);
        public static instancetype objectForPrimaryKey(id primaryKey);
        public static id allObjectsInRealm(Realm.RLMRealm realm);
        public static id objectsInRealm(Realm.RLMRealm realm) @where(NSString predicateFormat, params Void Param2);
        public static id objectsInRealm(Realm.RLMRealm realm) withPredicate(NSPredicate predicate);
        public static instancetype objectInRealm(Realm.RLMRealm realm) forPrimaryKey(id primaryKey);
        public NSArray linkingObjectsOfClass(NSString className) forProperty(NSString property);
        public BOOL isEqualToObject(Realm.RLMObject @object);
        public id objectForKeyedSubscript(NSString key);
        public void setObject(id obj) forKeyedSubscript(NSString key);
    }

    public     public void (NSString notification, Realm.RLMRealm realm);

    public     public void (id migration, NSUInteger oldSchemaVersion);

    public class Realm.RLMRealm: NSObject
    {
        public static instancetype defaultRealm();
        public static instancetype realmWithPath(NSString path);
        public static instancetype realmWithPath(NSString path) readOnly(BOOL @readonly) error(ref NSError error);
        public static instancetype realmWithPath(NSString path) encryptionKey(NSData key) readOnly(BOOL @readonly) error(ref NSError error);
        public static void setEncryptionKey(NSData key) forRealmsAtPath(NSString path);
        public static instancetype inMemoryRealmWithIdentifier(NSString identifier);

        public NSString path { get; }
        public BOOL readOnly { get; }
        public id schema { get; }
        public Realm.RLMNotificationToken addNotificationBlock(Realm.RLMNotificationBlock block);
        public void removeNotification(Realm.RLMNotificationToken notificationToken);
        public void beginWriteTransaction();
        public void commitWriteTransaction();
        public void cancelWriteTransaction();
        public void transactionWithBlock(        public void () block);
        public BOOL refresh();

        public BOOL autorefresh { get; set; }
        public BOOL writeCopyToPath(NSString path) error(ref NSError error);
        public BOOL writeCopyToPath(NSString path) encryptionKey(NSData key) error(ref NSError error);
        public void invalidate();
        public void addObject(Realm.RLMObject @object);
        public void addObjects(INSFastEnumeration array);
        public void addOrUpdateObject(Realm.RLMObject @object);
        public void addOrUpdateObjectsFromArray(id array);
        public void deleteObject(Realm.RLMObject @object);
        public void deleteObjects(id array);
        public void deleteAllObjects();
        public static void setDefaultRealmSchemaVersion(NSUInteger version) withMigrationBlock(Realm.RLMMigrationBlock block);
        public static void setSchemaVersion(NSUInteger version) forRealmAtPath(NSString realmPath) withMigrationBlock(Realm.RLMMigrationBlock block);
        public static NSUInteger schemaVersionAtPath(NSString realmPath) error(ref NSError error);
        public static NSUInteger schemaVersionAtPath(NSString realmPath) encryptionKey(NSData key) error(ref NSError error);
        public static NSError migrateRealmAtPath(NSString realmPath);
        public static NSError migrateRealmAtPath(NSString realmPath) encryptionKey(NSData key);

        public NSString defaultRealmPath { get; set; }
    }

    public class Realm.RLMNotificationToken: NSObject {}
}
