package com.at21.exercise.mapper;

import java.util.List;

import com.at21.exercise.pojo.Family;
import com.at21.exercise.pojo.QueryVo;
import com.at21.exercise.pojo.User;
import com.at21.exercise.util.Page;

public interface UserMapper {
	List<User> findUsers(QueryVo vo);
	
	//查询用户数
	Integer getCountByVo(QueryVo vo);

	User findUserById(String id);

	int deleteUserById(String id);

	int updateUser(User user);

	int checkCardId(String u_card_id);

	void insertUser(User user);

	void insertFamily(Family family);

	void editPwd(User user);

	List<User> loginCheck(User user);

	List<Family> findFamilyById(String id);
}
