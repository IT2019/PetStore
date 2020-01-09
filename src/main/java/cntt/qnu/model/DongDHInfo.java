package cntt.qnu.model;

public class DongDHInfo {
	private int id;
	private int idvatnuoi;
	private int iddh;
	private int soluong;
	// private int trangthai;
	public DongDHInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DongDHInfo(int id, int idvatnuoi, int iddh, int soluong) {
		super();
		this.id = id;
		this.idvatnuoi = idvatnuoi;
		this.iddh = iddh;
		this.soluong = soluong;
		// this.trangthai = trangthai;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdvatnuoi() {
		return idvatnuoi;
	}
	public void setIdvatnuoi(int idvatnuoi) {
		this.idvatnuoi = idvatnuoi;
	}
	public int getIddh() {
		return iddh;
	}
	public void setIddh(int iddh) {
		this.iddh = iddh;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	// public int getTrangthai() {
	// 	return trangthai;
	// }
	// public void setTrangthai(int trangthai) {
	// 	this.trangthai = trangthai;
	// }
}
