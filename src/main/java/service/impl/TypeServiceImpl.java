package service.impl;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.TypeDao;
import service.TypeService;
@Service
public class TypeServiceImpl implements TypeService{
	@Autowired
	 private TypeDao typeDao;
	public List<Map<String, Object>> selectAll(int pid) {
		List<Map<String, Object>> list=typeDao.selectAll(pid);
		return list;
	}
}
