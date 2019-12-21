package cntt.qnu.dao;

import java.util.List;

import javax.transaction.Transactional;

import cntt.qnu.model.VatNuoiInfo;
@Transactional
public interface VatNuoiDAO {
	public List<VatNuoiInfo> showList();
}
