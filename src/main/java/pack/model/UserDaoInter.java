package pack.model;

import pack.controller.UserBean;

public interface UserDaoInter {

	boolean insert(UserBean bean);
	boolean login(UserBean bean);
	
	int currentMaxnum();
	boolean useId(UserBean bean);
	boolean useName(UserBean bean);
	
	String selectName(UserBean bean);
	UserBean selectidUser(String id);
	UserBean selectNameUser(String name);
	String selectUsernoName(int userNo);
	
	UserBean selectunoUser(int userNo);
	
	String selectNoPwd(int userNo);
	int selectNameUserno(String name);
}
