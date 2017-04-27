import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import oracle.kv.Key;
import oracle.kv.Value;
import oracle.kv.ValueVersion;
import java.util.ArrayList;

class LoadRecords{

	public static void main(String args[]) {
		try
		{

			String storeName = "kvstore";
			String hostName = "localhost";
			String hostPort = "5000";

			KVStore store;

			ArrayList<String> majorList = new ArrayList<String>();
			ArrayList<String> minorList = new ArrayList<String>();
			Key key;
			Value value;
			String valueString;

			store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost" + ":" + "5000"));
			System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " opened.");

			//players
			majorList.add("Asjad"); //id fname
			majorList.add("Athick"); //id lname
			majorList.add("07012012"); //id dob
			minorList.add("Team1"); //teamname
			minorList.add("Wollongong"); //city
			minorList.add("CoachReza"); //nationality
			valueString = "Nat:Martian;Country:Australia;WhenTras:17/10/2007";
			key = Key.createKey(majorList, minorList);
			value = Value.createValue(valueString.getBytes());
			store.put(key, value);
			majorList.clear();
			minorList.clear();

			majorList.add("James"); //id fname
			majorList.add("Marino"); //id lname
			majorList.add("01012000"); //id dob
			minorList.add("Team1"); //teamname
			minorList.add("Wollongong"); //city
			minorList.add("CoachReza"); //nationality
			valueString = "Nat:Australian;Country:Australia;WhenTras:10/10/2007";
			key = Key.createKey(majorList, minorList);
			value = Value.createValue(valueString.getBytes());
			store.put(key, value);
			majorList.clear();
			minorList.clear();

			majorList.add("Daniel"); //id fname
			majorList.add("East"); //id lname
			majorList.add("08092000"); //id dob
			minorList.add("Team2"); //teamname
			minorList.add("Shellharbour"); //city
			minorList.add("CoachZam"); //nationality
			valueString = "Nat:Australian;Country:Australia;WhenTras:19/09/2007";
			key = Key.createKey(majorList, minorList);
			value = Value.createValue(valueString.getBytes());
			store.put(key, value);
			majorList.clear();
			minorList.clear();

			majorList.add("John"); //id fname
			majorList.add("West"); //id lname
			majorList.add("02021900"); //id dob
			minorList.add("Team2"); //teamname
			minorList.add("Shellharbour"); //city
			minorList.add("CoachZam"); //nationality
			valueString = "Nat:Australian;Country:Australia;WhenTras:10/08/2007";
			key = Key.createKey(majorList, minorList);
			value = Value.createValue(valueString.getBytes());
			store.put(key, value);
			majorList.clear();
			minorList.clear();





			store.close();
			System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " closed.");
		}
		catch (RuntimeException e) {
			e.printStackTrace();
		}
	}
}