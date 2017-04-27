/*
	Asjad Athick
	LoadData.java
*/

import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import oracle.kv.Key;
import oracle.kv.Value;
import oracle.kv.ValueVersion;
import java.util.ArrayList;

class LoadData {
	private static KVStore store;
	
	
	private static void AddApplicantDetails( 
		String anum, String... valueComponents) {
		ArrayList<String> majorList = new ArrayList<String>();
		majorList.add("applicant");
		majorList.add(anum);
		Key key = Key.createKey(majorList);
		AddPair(key, valueComponents);
	}

	private static void AddPosition( 
		String pnum, String... valueComponents) {
		ArrayList<String> majorList = new ArrayList<String>();
		majorList.add("position");
		majorList.add(pnum);
		Key key = Key.createKey(majorList);
		AddPair(key, valueComponents);
	}
	
	private static void AddSkillPoss( 
		String anum, String sname, String... valueComponents) {
		ArrayList<String> majorList = new ArrayList<String>();
		majorList.add("spossessed");
		majorList.add(anum);
		majorList.add(sname);
		Key key = Key.createKey(majorList);
		AddPair(key, valueComponents);
	}
	
	private static void AddSkillNeeded( 
		String pnum, String sname, String value) {
		ArrayList<String> majorList = new ArrayList<String>();
		majorList.add("sneeded");
		majorList.add(pnum);
		majorList.add(sname);
		Key key = Key.createKey(majorList);
		AddPair(key, value);
	}
	
	private static void AddApplication( 
		String anum, String pnum, String value) {
		ArrayList<String> majorList = new ArrayList<String>();
		majorList.add("applies");
		majorList.add(anum);
		majorList.add(pnum);
		Key key = Key.createKey(majorList);
		AddPair(key, value);
	}

	private static void AddPair(Key key, String... valueComponents) {
		String valueString = valueComponents[0];
		for (int i = 1; i < valueComponents.length; i++) {
			valueString += ("," + valueComponents[i]);
		}
		Value value = Value.createValue(valueString.getBytes());
		store.put(key, value);
	}
	
    public static void main(String args[]) {
        try {
		
			String storeName = "kvstore";
			String hostName = "localhost";
			String hostPort = "5000";
								
			store = KVStoreFactory.getStore(new KVStoreConfig(storeName, hostName + ":" + hostPort));
            
			System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " opened.");
			
			//load person 1
			AddApplicantDetails("000005", "MARGARET", "FINCH", "5 ANZAC PDE.", "SYDNEY", "NSW", "64573489", "", "", 
				"Microsoft ? Hmmm, does it still exist ?");
			AddSkillPoss("000005", "SQL PROGRAMMING", "6");
			
			//load person 2
			AddApplicantDetails("000008", "STEPHEN", "STAUNTON", "23 HUXLEY AVE.", "ALICE SPRINGS", "WA", "623778453", "", 
				"", "The best project ? Hello world !" );
			AddSkillPoss("000008", "COOKING", "9");
			AddSkillPoss("000008", "SQL PROGRAMMING", "3");
			
			//load positions
			AddPosition("00000002", "LECTURER", "UOW", "450000.00", "mouse pad", "Research");
			AddPosition("00000003", "SENIOR LECTURER", "UTS", "50000.00", "", "A lot of hard work");


			//add SNeeded for Positions	
			AddSkillNeeded("00000002", "JAVA PROGRAMMING", "8" );
			AddSkillNeeded("00000002", "C PROGRAMMING", "4" );

			AddSkillNeeded("00000003", "C++ PROGRAMMING", "7" );
			AddSkillNeeded("00000003", "JAVA PROGRAMMING", "10" );
			
			//add applies
			AddApplication("000005", "00000002", "22-JAN-2000" );
			AddApplication("000008", "00000004", "13-APR-2000" );

			
            store.close();
			System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " closed.");
        }
		catch (RuntimeException e) {
            e.printStackTrace();
        }
    }
}
