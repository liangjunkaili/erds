package erds.com.util;

import java.util.ArrayList;
import java.util.List;

public class FrequencyStruct {  
    
    public String uniqueKey;  
    public long start;  
    public long end;  
    public int time;  
    public int limit;  
    public List<Long> accessPoints = new ArrayList<Long>();  
      
    public void reset(long timeMillis) {  
          
        start = end = timeMillis;  
        accessPoints.clear();  
        accessPoints.add(timeMillis);  
    }  
  
    @Override  
    public String toString() {  
        return "FrequencyStruct [uniqueKey=" + uniqueKey + ", start=" + start  
                + ", end=" + end + ", time=" + time + ", limit=" + limit  
                + ", accessPoints=" + accessPoints + "]";  
    }  
}  
