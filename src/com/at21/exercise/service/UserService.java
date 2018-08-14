package com.at21.exercise.service;

import java.util.List;

import com.at21.exercise.pojo.Family;
import com.at21.exercise.pojo.QueryVo;
import com.at21.exercise.pojo.User;
import com.at21.exercise.util.Page;

public interface UserService {
	public Page<User> getUserByQueryVo(QueryVo vo);

	public User findUserById(String id);

	public int deleteUserById(String id);

	public int updateUser(User user);

	public boolean checkCardId(String u_card_id);

	public void insertUserAndFamily(User user, List<Family> families);
	
	public void insertUser(User user);
	
	public void editPwd(User user);

	public List<User> loginCheck(User user);

	public List<Family> findFamilyById(String id);
}
