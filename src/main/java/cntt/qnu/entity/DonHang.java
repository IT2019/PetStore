package cntt.qnu.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="don_hang")
public class DonHang {
	private int id;
	private String tennguoidat;
	private String sdt;
	private String email;
	private Date ngaydat;
	private String diachigiao;
	
	@Id
	@Column(name="id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="ten_nguoi_dat")
	public String getTennguoidat() {
		return tennguoidat;
	}
	public void setTennguoidat(String tennguoidat) {
		this.tennguoidat = tennguoidat;
	}
	@Column(name="sdt")
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	@Column(name="email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name="ngay_dat")
	public Date getNgaydat() {
		return ngaydat;
	}
	public void setNgaydat(Date ngaydat) {
		this.ngaydat = ngaydat;
	}
	@Column(name="dia_chi_giao")
	public String getDiachigiao() {
		return diachigiao;
	}
	public void setDiachigiao(String diachigiao) {
		this.diachigiao = diachigiao;
	}
	
}
