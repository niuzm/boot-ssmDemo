package com.at21.exercise.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.at21.exercise.mapper.UserMapper;
import com.at21.exercise.pojo.Family;
import com.at21.exercise.pojo.QueryVo;
import com.at21.exercise.pojo.User;
import com.at21.exercise.util.Page;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper mapper;
	public Page<User> getUserByQueryVo(QueryVo vo) {
		//从哪页开始
		vo.setStart((vo.getPage()-1)*vo.getRows());
		//查询总记录数
		Integer total=mapper.getCountByVo(vo);
		//查询每一页
		List<User> users = mapper.findUsers(vo);
		//封装数据到page中
		Page<User> page =new Page<User>(total, vo.getPage(), vo.getRows(), users);
		return page;
	}
	
	public User findUserById(String id) {
		// TODO Auto-generated method stub
		return mapper.findUserById(id);
	}
	
	public int deleteUserById(String id) {
		// TODO Auto-generated method stub
		return mapper.deleteUserById(id);
	}
	
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return mapper.updateUser(user);
	}
	
	public boolean checkCardId(String u_card_id) {
		// TODO Auto-generated method stub
		int checkCardId = mapper.checkCardId(u_card_id);
		if(checkCardId>0) {
			return true;
		}else
			return false;

	}

	@Transactional(value="transactionManager",rollbackFor=Exception.class)
	public void insertUserAndFamily(User user, List<Family> families) {
		// TODO Auto-generated method stub
		mapper.insertUser(user);
		for (Family family : families) {
			mapper.insertFamily(family);
		}
	}
	public void insertUser(User user) {
		// TODO Auto-generated method stub
		mapper.insertUser(user);
	}
	
	public void editPwd(User user) {
		// TODO Auto-generated method stub
		mapper.editPwd(user);
	}
	
	public List<User> loginCheck(User user) {
		// TODO Auto-generated method stub
		return mapper.loginCheck(user);
	}
	
	//查看家庭成员信息
	
	public List<Family> findFamilyById(String id) {
		// TODO Auto-generated method stub
		return mapper.findFamilyById(id);
	}
	

	

}
