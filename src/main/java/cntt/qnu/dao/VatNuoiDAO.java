package cntt.qnu.dao;

import java.util.List;

import javax.transaction.Transactional;

import cntt.qnu.entity.DonHang;
import cntt.qnu.model.DonHangInfo;
import cntt.qnu.model.DongDHInfo;
import cntt.qnu.model.LoaiVatNuoiInfo;
import cntt.qnu.model.VatNuoiInfo;
@Transactional
public interface VatNuoiDAO {
	public List<VatNuoiInfo> showList();
	public VatNuoiInfo findById(long vatNuoiId);
	//public List<VatNuoiInfo> getType(String loai);
	public List<LoaiVatNuoiInfo> loadLoai();
	public List<VatNuoiInfo> locTheoLoai(String idloai, int mucgia);
	public List<VatNuoiInfo> getVatNuoiById(long idvatnuoi);
	public List<VatNuoiInfo> timKiem(String key);
	public void themThongTinDonHang(DonHangInfo dh);
	public void themDongDH(int iddh, int idvatnuoi, int soluong);
	public int lastIdDH();
}
