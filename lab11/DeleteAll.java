import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import oracle.kv.Key;
import oracle.kv.Value;
import oracle.kv.ValueVersion;
import oracle.kv.KeyValueVersion;
import oracle.kv.Direction;

import java.util.ArrayList;
import java.util.Iterator;

class DeleteAll{

    public static void main(String args[]) {
        try {

            String storeName = "kvstore";
            String hostName = "localhost";
            String hostPort = "5000";

            KVStore store;

            store = KVStoreFactory.getStore(new KVStoreConfig(storeName, hostName + ":" + hostPort));
            System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " opened.");

            Iterator<KeyValueVersion> it = store.storeIterator(Direction.UNORDERED,0);
            System.out.println("In StoreIterator Method: Delete Everything");
            while (it.hasNext() )
            {
                KeyValueVersion kvvi = it.next();
                store.delete(kvvi.getKey());
            }

            store.close();
            System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " closed.");

        }
        catch (RuntimeException e) {
            e.printStackTrace();
        }
    }
}