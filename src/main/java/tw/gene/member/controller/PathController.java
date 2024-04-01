package tw.gene.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PathController {

	// 導到"首頁"
	@GetMapping("/index")
	public String goIndex() {
		return "index";
	}
	
	// 導到"註冊"
	@GetMapping("/register")
	public String goRegister() {
		return "member/clients/register";
	}
	
	// 導到"登入"
	@GetMapping("/login")
	public String goLogin() {
		return "member/clients/login";
	}
	
	// 導到"忘記密碼"
	@GetMapping("/forgetPassword")
	public String goForgetPassword() {
		return "member/clients/forgetPassword";
	}
	
	// 導到"會員抽獎"
	@GetMapping("/memberLottery")
	public String goMemberLottery() {
		return "member/clients/memberLottery";
	}
	
	// 導到"文章作者"
	@GetMapping("/authorData")
	public String goAuthorData() {
		return "member/clients/authorData";
	}
	
	// 導到"文章作者"
	@GetMapping("/forgetPwdServiceCenter")
	public String goForgetPwdServiceCenter() {
		return "member/clients/forgetPwdServiceCenter";
	}
	
	// 導到"會員中心"
	@GetMapping("/memberCenter")
	public String goMemberCenter() {
		return "member/clients/memberCenter";
	}
	
	// 導到"客服中心"
	@GetMapping("/customerServiceUser")
	public String goCustomerServiceUser() {
		return "member/clients/customerServiceUser";
	}
	
	// 導到"成功登出"
	@GetMapping("/logoutSuccess")
	public String gologoutSuccess() {
		return "member/logoutSuccess";
	}
	
	// 導到"二次驗證"
	@GetMapping("/validationPlace")
	public String goValidationPlace() {
		return "member/clients/validationPlace";
	}
	
	// 導到"Admin後台"
	@GetMapping("/backend")
	public String goBackend() {
		return "member/admin/backend";
	}
	
	// 導到"Admin查詢會員"
	@GetMapping("/memberQuery")
	public String goMemberQuery() {
		return "member/admin/memberQuery";
	}
	
	// 導到"Admin後台編輯會員"
	@GetMapping("/adminEdit")
	public String goAdminEdit() {
		return "member/admin/adminEdit";
	}
	
	// 導到"Admin客服中心"
	@GetMapping("/adminCustomerService")
	public String goAdminCustomerService() {
		return "member/admin/customerService";
	}
	
	// 導到"Admin平台管理系統"
	@GetMapping("/adminPlatformCenter")
	public String goAdminPlatformCenter() {
		return "member/admin/platformCenter";
	}
	
	// 導到"Admin獎品編輯"
	@GetMapping("/adminPrizeEdit")
	public String goAdminPrizeEdit() {
		return "member/admin/prizeEdit";
	}
	
	// 導到"Admin獎池"
	@GetMapping("/adminPrizePoolEdit")
	public String goAdminPrizePoolEdit() {
		return "member/admin/prizePoolEdit";
	}
	
	// 導到"查看對話紀錄"
	@GetMapping("/adminViewRecord")
	public String goAdminViewRecord() {
		return "member/admin/viewRecord";
	}
	
	// 導到"Admin編輯獎池"
	@GetMapping("/adminEditPrize")
	public String goAdminEditPrize() {
		return "member/admin/adminEditPrize";
	}



	

}
