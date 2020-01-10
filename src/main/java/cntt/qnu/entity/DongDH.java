package cntt.qnu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dongdh")
public class DongDH {
	private int id;
	private int idvatnuoi;
	private int iddh;
	private int soluong;
	private int trangthai;
	
	@Id
	@Column(name="id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="id_vat_nuoi")
	public int getIdvatnuoi() {
		return idvatnuoi;
	}
	public void setIdvatnuoi(int idvatnuoi) {
		this.idvatnuoi = idvatnuoi;
	}
	@Column(name="id_dh")
	public int getIddh() {
		return iddh;
	}
	public void setIddh(int iddh) {
		this.iddh = iddh;
	}
	@Column(name="so_luong")
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	@Column(name="trang_thai")
	public int getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}
	
	
}
