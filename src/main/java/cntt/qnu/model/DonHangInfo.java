package cntt.qnu.model;
import java.util.Date;

public class DonHangInfo {
	private int id;
	private String tennguoidat;
	private String sdt;
	private String email;
	private Date ngaydat;
	private String diachigiao;
	public DonHangInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DonHangInfo(int id, String tennguoidat, String sdt, String email, Date ngaydat, String diachigiao) {
		super();
		this.id = id;
		this.tennguoidat = tennguoidat;
		this.sdt = sdt;
		this.email = email;
		this.ngaydat = ngaydat;
		this.diachigiao = diachigiao;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTennguoidat() {
		return tennguoidat;
	}
	public void setTennguoidat(String tennguoidat) {
		this.tennguoidat = tennguoidat;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getNgaydat() {
		return ngaydat;
	}
	public void setNgaydat(Date ngaydat) {
		this.ngaydat = ngaydat;
	}
	public String getDiachigiao() {
		return diachigiao;
	}
	public void setDiachigiao(String diachigiao) {
		this.diachigiao = diachigiao;
	}
}
