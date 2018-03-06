package service;

import java.util.List;
import java.util.Map;

public interface TypeService {
	public List<Map<String, Object>> selectAll(int pid);
}
