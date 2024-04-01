package tw.gene.member.model.bean;

import java.util.List;

import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name = "userdata")
@Component
public class UserData {

	@Id
	@Column(name = "MID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int mid;

	@Column(name = "USERACC")
	private String userAcc;

	@Column(name = "USERPWD")
	private String userPwd;

	@Column(name = "VALIDATION")
	private String validation;

	@Column(name = "USERNAME")
	private String userName;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "GENDER")
	private String gender;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "MEMBERLV")
	private String memberLv;

	@Column(name = "LOTTERYTIMES")
	private String lotteryTimes;

	@Column(name = "LASTLOTTERYDATE")
	private String lastLotteryDate;

	@Column(name = "USERTEL")
	private String userTel;

	@Column(name = "BIRTHDAY")
	private String birthday;

	@Column(name = "MESSAGING")
	private int messaging;

	@Column(name = "USERPIC")
	private byte[] userPic;

	@Transient
	private String photoBase64;

	@OneToMany(mappedBy = "userData", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<UserStorage> userStorage;

	public int getMessaging() {
		return messaging;
	}

	public void setMessaging(int messaging) {
		this.messaging = messaging;
	}

	public List<UserStorage> getUserStorage() {
		return userStorage;
	}

	public void setUserStorage(List<UserStorage> userStorage) {
		this.userStorage = userStorage;
	}


	public String getValidation() {
		return validation;
	}

	public void setValidation(String validation) {
		this.validation = validation;
	}

	public String getLastLotteryDate() {
		return lastLotteryDate;
	}

	public void setLastLotteryDate(String lastLotteryDate) {
		this.lastLotteryDate = lastLotteryDate;
	}

	public String getLotteryTimes() {
		return lotteryTimes;
	}

	public void setLotteryTimes(String lotteryTimes) {
		this.lotteryTimes = lotteryTimes;
	}

	public String getPhotoBase64() {
		return photoBase64;
	}

	public void setPhotoBase64(String photoBase64) {
		this.photoBase64 = photoBase64;
	}

	public int getMid() {
		return mid;
	}

	public String getUserAcc() {
		return userAcc;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public String getEmail() {
		return email;
	}

	public String getGender() {
		return gender;
	}

	public String getaddress() {
		return address;
	}

	public String getMemberLv() {
		return memberLv;
	}

	public String getUserTel() {
		return userTel;
	}

	public String getBirthday() {
		return birthday;
	}

	public byte[] getUserPic() {
		return userPic;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public void setUserAcc(String userAcc) {
		this.userAcc = userAcc;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setaddress(String address) {
		this.address = address;
	}

	public void setMemberLv(String memberLv) {
		this.memberLv = memberLv;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public void setUserPic(byte[] userPic) {
		this.userPic = userPic;
	}


}
