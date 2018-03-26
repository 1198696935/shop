package service;
import java.util.ArrayList;
import pojo.Address;

public interface AddressService {
	
	ArrayList<Address> selectAll(int uid);
	boolean delAid(int aid);
	boolean add(Address address);
	boolean edit(Address address);
	ArrayList<Address> find(Integer uid, int page, int limit, String keyword);
}
