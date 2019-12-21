package cntt.qnu.model;

public class LoaiVatNuoiInfo {
	private int id;
	private String tenloai;
	public LoaiVatNuoiInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoaiVatNuoiInfo(int id, String tenloai) {
		super();
		this.id = id;
		this.tenloai = tenloai;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTenloai() {
		return tenloai;
	}
	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}
}
