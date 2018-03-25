package service;

import java.util.ArrayList;
import pojo.Address;
public interface AddressService {

	ArrayList<Address> selectAll(int uid);
	ArrayList<Address> findAll(int uid,int page, int limit, String keyword);

	boolean add(Address address);

	boolean edit(Address address);

	boolean delAid(int aid);

}
