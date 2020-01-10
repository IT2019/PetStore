package cntt.qnu.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import cntt.qnu.dao.VatNuoiDAO;
import cntt.qnu.entity.DonHang;
import cntt.qnu.entity.DongDH;
import cntt.qnu.entity.LoaiVatNuoi;
import cntt.qnu.entity.VatNuoi;
import cntt.qnu.model.DonHangInfo;
import cntt.qnu.model.DongDHInfo;
import cntt.qnu.model.LoaiVatNuoiInfo;
import cntt.qnu.model.VatNuoiInfo;

public class VatNuoiDAOImpl implements VatNuoiDAO{
	@Autowired
	private SessionFactory sessionfactory;
	
	@Override
	public List<VatNuoiInfo> showList() {
		Session session = sessionfactory.getCurrentSession();
		String sql= " Select new " + VatNuoiInfo.class.getName() + "(v.id,v.tenvatnuoi,v.giatien,v.hinhanh,v.mota,v.idloai,v.soluong)" +
				" from " + VatNuoi.class.getName() + " v ";
		Query query = session.createQuery(sql);
		List<VatNuoiInfo> list= query.list();
	
		return list;
	}

	// @Override
	// public List<VatNuoiInfo> getType(String loai){
		
	// }
	@Override
	public List<LoaiVatNuoiInfo> loadLoai(){
		Session session = sessionfactory.getCurrentSession();
		String sql= " Select new " + LoaiVatNuoiInfo.class.getName() + "(l.id,l.tenloai)" +
				" from " + LoaiVatNuoi.class.getName() + " l ";
		Query query = session.createQuery(sql);
		List<LoaiVatNuoiInfo> list= query.list();
	
		return list;
	}

	@Override
	public List<VatNuoiInfo> locTheoLoai(String idloai, int mucgia) {
		String sql;
		Session session = sessionfactory.getCurrentSession();
		int price= mucgia*1000000;
		int price1=price+1000000;
		if (mucgia==-1){
			sql= " Select new " + VatNuoiInfo.class.getName() + "(v.id,v.tenvatnuoi,v.giatien,v.hinhanh,v.mota,v.idloai,v.soluong)" +
				" from " + VatNuoi.class.getName() + " v " + "Where v.idloai=" + idloai;
		}
		else{
		sql= " Select new " + VatNuoiInfo.class.getName() + "(v.id,v.tenvatnuoi,v.giatien,v.hinhanh,v.mota,v.idloai,v.soluong)" +
				" from " + VatNuoi.class.getName() + " v " + "Where v.idloai=" + idloai + " AND v.giatien>=" + price + " AND v.giatien<=" + price1;
		}
		
		Query query = session.createQuery(sql);
		List<VatNuoiInfo> list= query.list();
		
		return list;
	}

	@Override
	public List<VatNuoiInfo> getVatNuoiById(long idvatnuoi) {
		Session session = sessionfactory.getCurrentSession();
		String sql= " Select new " + VatNuoiInfo.class.getName() + "(v.id,v.tenvatnuoi,v.giatien,v.hinhanh,v.mota,v.idloai,v.soluong)" +
				" from " + VatNuoi.class.getName() + " v " + "Where v.id=" + idvatnuoi;
		Query query = session.createQuery(sql);
		List<VatNuoiInfo> list= query.list();
	
		return list;
	}
	@Override
	public VatNuoiInfo findById(long idvatnuoi) {
		Session session = sessionfactory.getCurrentSession();
		String sql= " Select new " + VatNuoiInfo.class.getName() + "(v.id,v.tenvatnuoi,v.giatien,v.hinhanh,v.mota,v.idloai,v.soluong)" +
				" from " + VatNuoi.class.getName() + " v " + "Where v.id=" + idvatnuoi;
		Query query = session.createQuery(sql);
		List<VatNuoiInfo> list= query.list();
			list.get(0);

		 return list.get(0);
	}

	@Override
	public List<VatNuoiInfo> timKiem(String key) {
		Session session = sessionfactory.getCurrentSession();
		String sql= " Select new " + VatNuoiInfo.class.getName() + "(v.id,v.tenvatnuoi,v.giatien,v.hinhanh,v.mota,v.idloai,v.soluong)" +
				" from " + VatNuoi.class.getName() + " v " + "Where v.tenvatnuoi LIKE '%" + key + "%'";
		Query query = session.createQuery(sql);
		List<VatNuoiInfo> list= query.list();
		return list;
	}

	@Override
	public void themThongTinDonHang(DonHangInfo dh) {
		Session session = sessionfactory.getCurrentSession();
		DonHang dhentity= new DonHang();
		dhentity.setId(dh.getId());
		dhentity.setTennguoidat(dh.getTennguoidat());
		dhentity.setSdt(dh.getSdt());
		dhentity.setEmail(dh.getEmail());
		dhentity.setNgaydat(dh.getNgaydat());
		dhentity.setDiachigiao(dh.getDiachigiao());
		session.persist(dhentity);
	}

	@Override
	public int lastIdDH() {
		Session session = sessionfactory.getCurrentSession();
		String sql=" Select new " + DonHangInfo.class.getName() + "(h.id, h.tennguoidat, h.sdt, h.email, h.ngaydat, h.diachigiao)" +
		" from " + DonHang.class.getName() + " h ";
		Query query = session.createQuery(sql);
		List<DonHangInfo> list= query.list();
			

		 return list.get(list.size()-1).getId();
	}

	@Override
	public void themDongDH(int iddh, int idvatnuoi, int soluong){
		Session session = sessionfactory.getCurrentSession();
		DongDH ddhentity = new DongDH();
		ddhentity.setIddh(iddh);
		ddhentity.setIdvatnuoi(idvatnuoi);
		ddhentity.setSoluong(soluong);
		session.persist(ddhentity);
		}

	@Override
	public List<DongDHInfo> acceptAdmin() {
		Session session = sessionfactory.getCurrentSession();
		String sql=" Select new " + DongDHInfo.class.getName() + "(d.id, d.idvatnuoi, d.iddh, d.soluong, d.trangthai)" +
		" from " + DongDH.class.getName() + " d " + "Where d.trangthai = 0";
		Query query = session.createQuery(sql);
		List<DongDHInfo> list= query.list();
		return list;
	}
	
	@Override
	public DongDHInfo getDDH(int id) {
		Session session = sessionfactory.getCurrentSession();
		String sql=" Select new " + DongDHInfo.class.getName() + "(d.id, d.idvatnuoi, d.iddh, d.soluong, d.trangthai)" +
		" from " + DongDH.class.getName() + " d " + "Where d.id =" +id;
		Query query = session.createQuery(sql);
		List<DongDHInfo> list= query.list();
		return list.get(0);
	}

	@Override
	public void updateStatus(DongDHInfo ddh) {
		// TODO Auto-generated method stub
		Session session = sessionfactory.getCurrentSession();
		DongDH ddhentity = new DongDH();
		ddhentity.setId(ddh.getId());
		ddhentity.setIddh(ddh.getIddh());
		ddhentity.setIdvatnuoi(ddh.getIdvatnuoi());
		ddhentity.setSoluong(ddh.getSoluong());
		ddhentity.setTrangthai(1);
		session.update(ddhentity);
	}

	@Override
	public DonHangInfo getDH(int id) {
		
		Session session = sessionfactory.getCurrentSession();
		String sql=" Select new " + DonHangInfo.class.getName() + "(h.id, h.tennguoidat, h.sdt, h.email, h.ngaydat, h.diachigiao)" +
		" from " + DonHang.class.getName() + " h " + "Where h.id =" +id;
		Query query = session.createQuery(sql);
		List<DonHangInfo> list= query.list();
		return list.get(0);
	}

	@Override
	public VatNuoiInfo getTen(int id) {
		Session session = sessionfactory.getCurrentSession();
		String sql= " Select new " + VatNuoiInfo.class.getName() + "(v.id,v.tenvatnuoi,v.giatien,v.hinhanh,v.mota,v.idloai,v.soluong)" +
				" from " + VatNuoi.class.getName() + " v " + "Where v.id="+id;
		Query query = session.createQuery(sql);
		List<VatNuoiInfo> list= query.list();
	
		return list.get(0);
	}
}
