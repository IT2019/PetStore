package cntt.qnu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vat_nuoi")
public class VatNuoi {
	private int id;
	private String tenvatnuoi;
	private int giatien;
	private String hinhanh;
	private String mota;
	private int idloai;
	private int soluong;
	
	@Id
	@Column(name="id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="ten_vat_nuoi")
	public String getTenvatnuoi() {
		return tenvatnuoi;
	}
	public void setTenvatnuoi(String tenvatnuoi) {
		this.tenvatnuoi = tenvatnuoi;
	}
	@Column(name="gia_tien")
	public int getGiatien() {
		return giatien;
	}
	public void setGiatien(int giatien) {
		this.giatien = giatien;
	}
	@Column(name="hinh_anh")
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	@Column(name="mo_ta")
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	@Column(name="id_loai")
	public int getIdloai() {
		return idloai;
	}
	public void setIdloai(int idloai) {
		this.idloai = idloai;
	}
	@Column(name="so_luong")
	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	
	
}
