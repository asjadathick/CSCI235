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

class MatchSkills {
	private static KVStore store;
	
	private static Iterator<KeyValueVersion> getStoreIterator(String... keys) {
		ArrayList<String> searchKeys = new ArrayList<String>();
		for (int i = 0; i < keys.length; i++) {
			searchKeys.add(keys[i]);
		}
		Key search = Key.createKey(searchKeys);
		
		return store.storeIterator(
			Direction.UNORDERED, 0, search, null, null);
	}
	
    public static void main(String args[]) {
        try {
		
			String storeName = "kvstore";
			String hostName = "localhost";
			String hostPort = "5000";
								
			store = KVStoreFactory.getStore(new KVStoreConfig(storeName, hostName + ":" + hostPort));
            
			System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " opened.");
			
			String requiredPositionNumber = "00000002";
			
			Iterator<KeyValueVersion> applicantIterator = 
				getStoreIterator("applicant");
			
			while (applicantIterator.hasNext()) {
				KeyValueVersion applicantKvv = applicantIterator.next();
				Key applicantKey = applicantKvv.getKey();
				String[] applicantMajorPath = applicantKey.getMajorPath().toArray(new String[0]);
				String applicantNumber = applicantMajorPath[1];
				String[] applicantValues = new String(applicantKvv.getValue().getValue()).split(",");
				String applicantName = applicantValues[0] + " " + applicantValues[1];
				
				boolean unqualified = false;
				
				Iterator<KeyValueVersion> sneededIterator = 
					getStoreIterator("sneeded", requiredPositionNumber);
				
				while (sneededIterator.hasNext()) {
					KeyValueVersion sneededKvv = sneededIterator.next();
					Key sneededKey = sneededKvv.getKey();
					String[] sneededMajorPath = sneededKey.getMajorPath().toArray(new String[0]);
					String sneededSkillName = sneededMajorPath[2];
					String[] sneededValues = new String(sneededKvv.getValue().getValue()).split(",");
					int sneededSkillLevel = Integer.parseInt(sneededValues[0]);
						
					boolean hasSkill = false;
					
					Iterator<KeyValueVersion> spossessedIterator = 
						getStoreIterator("spossessed", applicantNumber, sneededSkillName);
					
					while (spossessedIterator.hasNext()) {
						KeyValueVersion spossessedKvv = spossessedIterator.next();
						Key spossesedKey = spossessedKvv.getKey();
						String[] spossessedMajorPath = spossesedKey.getMajorPath().toArray(new String[0]);
						String spossesedSkillName = spossessedMajorPath[2];
						String[] spossessedValues = new String(spossessedKvv.getValue().getValue()).split(",");
						int spossessedSkillLevel = Integer.parseInt(spossessedValues[0]);
						
						if (spossessedSkillLevel >= sneededSkillLevel) {
							hasSkill = true;
						}
					}
					if (!hasSkill) {
						unqualified = true;
						break;
					}
					
				}
				if (!unqualified) {
					System.out.println(applicantName + " possesses skill for the position " + requiredPositionNumber);
				}
			}
			
            store.close();
			System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " closed.");
        }
		catch (RuntimeException e) {
            e.printStackTrace();
        }
    }
}
