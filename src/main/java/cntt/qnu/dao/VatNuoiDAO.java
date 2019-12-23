package cntt.qnu.dao;

import java.util.List;

import javax.transaction.Transactional;

import cntt.qnu.model.LoaiVatNuoiInfo;
import cntt.qnu.model.VatNuoiInfo;
@Transactional
public interface VatNuoiDAO {
	public List<VatNuoiInfo> showList();
	//public List<VatNuoiInfo> getType(String loai);
	public List<LoaiVatNuoiInfo> loadLoai();
	public List<VatNuoiInfo> locTheoLoai(String idloai, int mucgia);
	public List<VatNuoiInfo> getVatNuoiById(long idvatnuoi);
}
