package service;

import java.util.ArrayList;
import pojo.Address;
import pojo.User;


public interface AddressService {

	ArrayList<Address> selectAll(int uid);

	boolean delAid(int aid,int uid);

	ArrayList<Address> findAll(int uid,int page, int limit, String keyword);

	boolean add(Address address);

}
