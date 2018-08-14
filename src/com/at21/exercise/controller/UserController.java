package com.at21.exercise.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.at21.exercise.pojo.Family;
import com.at21.exercise.pojo.QueryVo;
import com.at21.exercise.pojo.User;

import com.at21.exercise.service.UserService;
import com.at21.exercise.util.Page;

/*
 * 客户信息请求处理
 * 
 */
@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	@RequestMapping("list")
	public String list(Model model,QueryVo vo) {
		//分页查询
		Page<User> page = userService.getUserByQueryVo(vo);
		model.addAttribute("page", page);
		model.addAttribute("status",vo.getVo_u_status());
		
		return "customer";
	}
	//编辑用户信息的数据回显
	@RequestMapping("edit")
	@ResponseBody
	public User edit(String id) throws ParseException {
//		根据id查询数据
		User user=userService.findUserById(id);
		System.out.println(user.getU_birthday());
		
		return user;
	}
	//家庭成员信息的数据回显
	@RequestMapping("showFamily")
	@ResponseBody
	public List<Family> showFamily(String id,Model model) {
//		根据id查询数据
		List<Family> familys=userService.findFamilyById(id);
		model.addAttribute("familys", familys);
		return familys;
	}
	
	
	//删除用户
		@RequestMapping("delete")
		@ResponseBody
		public boolean delete(String id) {
//			根据id查询数据
			int flag=userService.deleteUserById(id);
			boolean bflag=false;
			if(flag==0) {
				bflag=false;
			}else {
				bflag=true;
			}
			return bflag;
		}
		
//		修改用户信息
		@RequestMapping("update")
		@ResponseBody
		public boolean update(User user,String birthday,String cmbProvince,String cmbCity,String cmbArea) throws ParseException {
			System.out.println(birthday);
			SimpleDateFormat smf=new SimpleDateFormat("yyyy-MM-dd");
			Date u_birthday = smf.parse(birthday);
			user.setU_birthday(u_birthday);
			
			//拼接三级联动地址串
			String address=cmbProvince+"-"+cmbCity+"-"+cmbArea+"-";
			//获取详细住址
			String cadd = user.getU_now_addr();
			//拼接地址
			String addr=address+cadd;
			user.setU_now_addr(addr);
			 
			
			int flag=userService.updateUser(user);
			return true;
		}
	@RequestMapping("ha")
	public String ha(HttpSession session) {
		String user=(String) session.getAttribute("existUser");
		System.out.println(user+"axasdfds");
		if(user==null) {
			return "redirect:/login.jsp";
		}
		return "home";
	}
	@RequestMapping("left")
	public String left() {
		return "left";
	}
	@RequestMapping("top")
	public String top() {
		return "top";
	}
	//登录
	@RequestMapping("login")
	public String login(User user,HttpSession session) {
		List<User> u=new ArrayList<User>();
		u=userService.loginCheck(user);
		
		if(!u.isEmpty()) {
			String uname=u.get(0).getU_name();
			session.setAttribute("existUser", uname);
			return "redirect:/user/ha.action";
		}else {
			return "redirect:/login.jsp";

		}
		
	}
	@RequestMapping("loginOut")
	@ResponseBody
	public boolean loginOut(HttpSession session) {
		session.removeAttribute("existUser");
		return true;
		
	}
	
//	添加用户
	@RequestMapping("addUser")
	public ModelAndView addUser(User user,String cmbProvince,String cmbCity,String cmbArea,String familyname,
								String familyphone,String familysex,String familycardid) {
		//拼接三级联动地址串
		String address=cmbProvince+"-"+cmbCity+"-"+cmbArea+"-";
		//获取详细住址
		String cadd = user.getU_now_addr();
		//拼接地址
		String addr=address+cadd;
		user.setU_now_addr(addr);
		//设置插入的用户的id
		String uid = UUID.randomUUID().toString();
		user.setU_id(uid);
		//设置日期
		user.setU_birthday(new Date());
		//获取家庭成员字符数组
		String[] familynames = familyname.split(",");
		String[] familyphones=familyphone.split(",");
		String[] familysexs=familysex.split(",");
		String[] familycardids=familycardid.split(",");
		System.out.println("user"+user.getU_name());
		System.out.println("family"+familynames[0]+familyphones[0]+familysexs[0]);
		
		List<Family> families=new ArrayList<Family>();
		int i=0;
		for (String card : familycardids) {
			Family e = new Family();
			e.setF_card_id(familycardids[i]);
			e.setF_name(familynames[i]);
			e.setF_phone(familyphones[i]);
			e.setF_sex(familysexs[i]);
			e.setU_id(uid);
			families.add(e);
			
			i++;
		}
		userService.insertUserAndFamily(user,families);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("forward:/user/list.action");
		return mav;
	}
	
	//修改密码
	@RequestMapping("editPwd")
	public String editPwd(User user) {
		userService.editPwd(user);
		
		return "forward:/user/list.action";
	}
	
	//校验身份证
	@RequestMapping("checkCardId")
	@ResponseBody
	public boolean checkCardId(String u_card_id) {
		boolean flag=userService.checkCardId(u_card_id);
		System.out.println(flag+"sdfsdf");
		return flag;
	}
	
	
	
	
	
	
	
	
	static Random random =new Random(888);
	
	
	@RequestMapping("test")
	public void test11() {
		
		for (int i = 0; i < 10000; i++) {
			
			 
			User user=new User();
			String u_name=getName();
			user.setU_name(u_name);
			
			String u_card_id=getCardId().toString();
			user.setU_card_id(u_card_id);
			Date u_birthday=new Date();
			user.setU_birthday(u_birthday);
			
			String u_email=getEmail().toString();
			user.setU_email(u_email);
			
			String u_id=getId();
			user.setU_id(u_id);
			
			user.setU_password("123");
			
			user.setU_username(getUsername());

			
			user.setU_married(getMarry());
			
			
			user.setU_now_addr("上海-市辖区-黄浦区");
			
			user.setU_sex(getSex());
			
			user.setU_nation("汉族");
			
			user.setU_phone(getPhone());
			
			user.setU_status("1");
			
			System.out.println(user.toString());
			List<Family> families = new ArrayList<Family>();
			Family family = new Family();
			family.setU_id(u_id);
			family.setF_card_id(getCardId().toString());
			family.setF_name(getName());
			family.setF_phone(getPhone());
			family.setF_sex(getSex());
			Family family2 = new Family();
			family2.setU_id(u_id);
			family2.setF_card_id(getCardId().toString());
			family2.setF_name(getName());
			family2.setF_phone(getPhone());
			family2.setF_sex(getSex());
			families.add(family);
			families.add(family2);
			userService.insertUserAndFamily(user, families);
			
		}
	}
	
	
	public static String getName() {
		String[] xing= {"张","王","李","赵","上官","关","齐","黄","洪"};
		String[] ming= {"于","如","下","图","所","示","的","样","式","布","局","方式","包括","人","口","列","表","和","人","口","新","增","两","个","能","其","中","人","口","列","表","页","面","请","增"};
		int xindex=random.nextInt(xing.length-1);
		int mindex=random.nextInt(ming.length-1);
		String name=xing[xindex]+ming[mindex];
		return name;
		
	}
	
	public static StringBuilder getCardId() {
		StringBuilder sb=new StringBuilder();
		for (int i = 0; i <18; i++) {
			int x=random.nextInt(10);
			sb.append(x);
		}
		return sb;
		
	}
	
	public static StringBuilder getEmail() {
		StringBuilder sb=new StringBuilder();
		for (int i = 0; i <3; i++) {
			int x=random.nextInt(10);
			sb.append(x);
		}
		sb.append("@21at.com.cn");
		return sb;
		
	}
	
	
	public static String getId() {
		
		return UUID.randomUUID().toString();
		
		
	}
	
	public static String getUsername() {
		StringBuilder sb=new StringBuilder();

		for (int i = 0; i <3; i++) {
			
		
		String chars="qwertyuioplkjhgfdsazxcvbnm";
		char c = chars.charAt(random.nextInt(25));
		sb.append(c);
		}
		
		return sb.toString();
		
		
	}
	
	public static String getPhone() {
		StringBuilder sb=new StringBuilder();
		sb.append(1);
		sb.append(3);
		sb.append(0);
		for (int i = 0; i <8; i++) {
			
			
			int t = random.nextInt(10);
			sb.append(t);
		}
		
		return sb.toString();
		
		
	}
	public static String getMarry() {
		
		if(random.nextInt(2)==1) {
			return "是";
		}else {
			return "否";
		}
		
		
		
		
	}
	public static String getSex() {
		
		if(random.nextInt(2)==1) {
			return "男";
		}else {
			return "女";
		}
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
}







