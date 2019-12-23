package cntt.qnu.model;

public class VatNuoiInfo {
	private int id;
	private String tenvatnuoi;
	private int giatien;
	private String hinhanh;
	private String mota;
	private int idloai;
	private int soluong;
	public VatNuoiInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VatNuoiInfo(int id, String tenvatnuoi, int giatien, String hinhanh, String mota, int idloai, int soluong) {
		super();
		this.id = id;
		this.tenvatnuoi = tenvatnuoi;
		this.giatien = giatien;
		this.hinhanh = hinhanh;
		this.mota = mota;
		this.idloai = idloai;
		this.soluong= soluong;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTenvatnuoi() {
		return tenvatnuoi;
	}
	public void setTenvatnuoi(String tenvatnuoi) {
		this.tenvatnuoi = tenvatnuoi;
	}
	public int getGiatien() {
		return giatien;
	}
	public void setGiatien(int giatien) {
		this.giatien = giatien;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	public int getIdloai() {
		return idloai;
	}
	public void setIdloai(int idloai) {
		this.idloai = idloai;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

}
