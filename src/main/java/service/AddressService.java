package service;

import java.util.ArrayList;
import pojo.Address;


public interface AddressService {

	ArrayList<Address> selectAll(int uid);

	boolean delAid(int aid,int uid);

}
