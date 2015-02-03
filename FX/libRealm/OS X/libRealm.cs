//  Import of libRealm ()
//  Frameworks:
//  Targets: x86_64
//  Dep fx:rtl, Foundation
//  Dep libs:Realm, tightdb, c++
namespace 
{
    public interface Realm.Realm.IRLMCollection
    {
        NSUInteger count { get; }
        NSString objectClassName { get; }
        Realm.Realm.RLMRealm realm { get; }
        id objectAtIndex(NSUInteger index);
        id firstObject();
        id lastObject();
        NSUInteger indexOfObject(Realm.Realm.RLMObject @object);
        NSUInteger indexOfObjectWhere(NSString predicateFormat, params Void Param1);
        NSUInteger indexOfObjectWithPredicate(NSPredicate predicate);
        Realm.Realm.RLMResults objectsWhere(NSString predicateFormat, params Void Param1);
        Realm.Realm.RLMResults objectsWithPredicate(NSPredicate predicate);
        Realm.Realm.RLMResults sortedResultsUsingProperty(NSString property) @ascending(BOOL @ascending);
        Realm.Realm.RLMResults sortedResultsUsingDescriptors(NSArray properties);
        id objectAtIndexedSubscript(NSUInteger index);
    }

    public class Realm.Realm.RLMArray: NSObject
    {
        public NSUInteger count { get; }
        public NSString objectClassName { get; }
        public Realm.Realm.RLMRealm realm { get; }
        public id objectAtIndex(NSUInteger index);
        public id firstObject();
        public id lastObject();
        public void addObject(Realm.Realm.RLMObject @object);
        public void addObjects(INSFastEnumeration objects);
        public void insertObject(Realm.Realm.RLMObject anObject) atIndex(NSUInteger index);
        public void removeObjectAtIndex(NSUInteger index);
        public void removeLastObject();
        public void removeAllObjects();
        public void replaceObjectAtIndex(NSUInteger index) withObject(Realm.Realm.RLMObject anObject);
        public NSUInteger indexOfObject(Realm.Realm.RLMObject @object);
        public NSUInteger indexOfObjectWhere(NSString predicateFormat, params Void Param1);
        public NSUInteger indexOfObjectWithPredicate(NSPredicate predicate);
        public Realm.Realm.RLMResults objectsWhere(NSString predicateFormat, params Void Param1);
        public Realm.Realm.RLMResults objectsWithPredicate(NSPredicate predicate);
        public Realm.Realm.RLMResults sortedResultsUsingProperty(NSString property) @ascending(BOOL @ascending);
        public Realm.Realm.RLMResults sortedResultsUsingDescriptors(NSArray properties);
        public id objectAtIndexedSubscript(NSUInteger index);
        public void setObject(id newValue) atIndexedSubscript(NSUInteger index);
        public instancetype init();
        public static instancetype @new();
    }

    public class Realm.Realm.RLMSortDescriptor: NSObject
    {
        public NSString property { get; }
        public BOOL @ascending { get; }
        public static instancetype sortDescriptorWithProperty(NSString propertyName) @ascending(BOOL @ascending);
        public instancetype reversedSortDescriptor();
    }

    public     public void (Realm.Realm.RLMObject oldObject, Realm.Realm.RLMObject newObject);

    public class Realm.Realm.RLMMigration: NSObject
    {
        public Realm.Realm.RLMSchema oldSchema { get; }
        public Realm.Realm.RLMSchema newSchema { get; }
        public void enumerateObjects(NSString className) block(Realm.Realm.RLMObjectMigrationBlock block);
        public Realm.Realm.RLMObject createObject(NSString className) withObject(id @object);
        public void deleteObject(Realm.Realm.RLMObject @object);
    }

    public class Realm.Realm.RLMObjectBase: NSObject
    {
        public Realm.Realm.RLMRealm realm { get; }
        public id objectSchema { get; }
        public BOOL invalidated { get; }
        public instancetype init();
        public instancetype initWithObject(id @object);
        public instancetype initWithObject(id @value) schema(Realm.Realm.RLMSchema schema);
        public instancetype initWithObjectSchema(id schema);
        public BOOL isEqualToObject(Realm.Realm.RLMObjectBase @object);
        public NSArray linkingObjectsOfClass(NSString className) forProperty(NSString property);
        public id objectForKeyedSubscript(NSString key);
        public void setObject(id obj) forKeyedSubscript(NSString key);
        public static NSString className();
        public static NSDictionary defaultPropertyValues();
        public static NSString primaryKey();
        public static NSArray ignoredProperties();
    }

    public class Realm.Realm.RLMObject: Realm.Realm.RLMObjectBase
    {
        public instancetype init();
        public instancetype initWithObject(id @object);
        public static NSString className();
        public static instancetype createInDefaultRealmWithObject(id @object);
        public static instancetype createInRealm(Realm.Realm.RLMRealm realm) withObject(id @object);
        public static instancetype createOrUpdateInDefaultRealmWithObject(id @object);
        public static instancetype createOrUpdateInRealm(Realm.Realm.RLMRealm realm) withObject(id @object);

        public Realm.Realm.RLMRealm realm { get; }
        public id objectSchema { get; }
        public BOOL invalidated { get; }
        public BOOL deletedFromRealm { get; }
        public static NSArray indexedProperties();
        public static NSDictionary defaultPropertyValues();
        public static NSString primaryKey();
        public static NSArray ignoredProperties();
        public static Realm.Realm.RLMResults allObjects();
        public static Realm.Realm.RLMResults objectsWhere(NSString predicateFormat, params Void Param1);
        public static Realm.Realm.RLMResults objectsWithPredicate(NSPredicate predicate);
        public static instancetype objectForPrimaryKey(id primaryKey);
        public static Realm.Realm.RLMResults allObjectsInRealm(Realm.Realm.RLMRealm realm);
        public static Realm.Realm.RLMResults objectsInRealm(Realm.Realm.RLMRealm realm) @where(NSString predicateFormat, params Void Param2);
        public static Realm.Realm.RLMResults objectsInRealm(Realm.Realm.RLMRealm realm) withPredicate(NSPredicate predicate);
        public static instancetype objectInRealm(Realm.Realm.RLMRealm realm) forPrimaryKey(id primaryKey);
        public NSArray linkingObjectsOfClass(NSString className) forProperty(NSString property);
        public BOOL isEqualToObject(Realm.Realm.RLMObject @object);
        public id objectForKeyedSubscript(NSString key);
        public void setObject(id obj) forKeyedSubscript(NSString key);
    }

    public     public void (NSString notification, Realm.Realm.RLMRealm realm);

    public     public void (Realm.Realm.RLMMigration migration, NSUInteger oldSchemaVersion);

    public class Realm.Realm.RLMRealm: NSObject
    {
        public static instancetype defaultRealm();
        public static instancetype realmWithPath(NSString path);
        public static instancetype realmWithPath(NSString path) readOnly(BOOL @readonly) error(ref NSError error);
        public static instancetype realmWithPath(NSString path) encryptionKey(NSData key) readOnly(BOOL @readonly) error(ref NSError error);
        public static void setEncryptionKey(NSData key) forRealmsAtPath(NSString path);
        public static instancetype inMemoryRealmWithIdentifier(NSString identifier);

        public NSString path { get; }
        public BOOL readOnly { get; }
        public Realm.Realm.RLMSchema schema { get; }
        public Realm.Realm.RLMNotificationToken addNotificationBlock(Realm.Realm.RLMNotificationBlock block);
        public void removeNotification(Realm.Realm.RLMNotificationToken notificationToken);
        public void beginWriteTransaction();
        public void commitWriteTransaction();
        public void cancelWriteTransaction();
        public void transactionWithBlock(        public void () block);
        public BOOL refresh();

        public BOOL autorefresh { get; set; }
        public BOOL writeCopyToPath(NSString path) error(ref NSError error);
        public BOOL writeCopyToPath(NSString path) encryptionKey(NSData key) error(ref NSError error);
        public void invalidate();
        public void addObject(Realm.Realm.RLMObject @object);
        public void addObjects(INSFastEnumeration array);
        public void addOrUpdateObject(Realm.Realm.RLMObject @object);
        public void addOrUpdateObjectsFromArray(id array);
        public void deleteObject(Realm.Realm.RLMObject @object);
        public void deleteObjects(id array);
        public void deleteAllObjects();
        public static void setDefaultRealmSchemaVersion(NSUInteger version) withMigrationBlock(Realm.Realm.RLMMigrationBlock block);
        public static void setSchemaVersion(NSUInteger version) forRealmAtPath(NSString realmPath) withMigrationBlock(Realm.Realm.RLMMigrationBlock block);
        public static NSUInteger schemaVersionAtPath(NSString realmPath) error(ref NSError error);
        public static NSUInteger schemaVersionAtPath(NSString realmPath) encryptionKey(NSData key) error(ref NSError error);
        public static NSError migrateRealmAtPath(NSString realmPath);
        public static NSError migrateRealmAtPath(NSString realmPath) encryptionKey(NSData key);

        public NSString defaultRealmPath { get; set; }
    }

    public class Realm.Realm.RLMNotificationToken: NSObject {}

    public class Realm.Realm.RLMResults: NSObject
    {
        public NSUInteger count { get; }
        public NSString objectClassName { get; }
        public Realm.Realm.RLMRealm realm { get; }
        public id objectAtIndex(NSUInteger index);
        public id firstObject();
        public id lastObject();
        public NSUInteger indexOfObject(Realm.Realm.RLMObject @object);
        public NSUInteger indexOfObjectWhere(NSString predicateFormat, params Void Param1);
        public NSUInteger indexOfObjectWithPredicate(NSPredicate predicate);
        public Realm.Realm.RLMResults objectsWhere(NSString predicateFormat, params Void Param1);
        public Realm.Realm.RLMResults objectsWithPredicate(NSPredicate predicate);
        public Realm.Realm.RLMResults sortedResultsUsingProperty(NSString property) @ascending(BOOL @ascending);
        public Realm.Realm.RLMResults sortedResultsUsingDescriptors(NSArray properties);
        public id minOfProperty(NSString property);
        public id maxOfProperty(NSString property);
        public NSNumber sumOfProperty(NSString property);
        public NSNumber averageOfProperty(NSString property);
        public id objectAtIndexedSubscript(NSUInteger index);
        public instancetype init();
        public static instancetype @new();
    }

    public class Realm.Realm.RLMSchema: NSObject
    {
        public NSArray objectSchema { get; }
        public id schemaForClassName(NSString className);
        public id objectForKeyedSubscript(INSCopying className);
        public BOOL isEqualToSchema(Realm.Realm.RLMSchema schema);
    }
}
