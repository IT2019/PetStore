package cntt.qnu.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import cntt.qnu.dao.VatNuoiDAO;
import cntt.qnu.entity.LoaiVatNuoi;
import cntt.qnu.entity.VatNuoi;
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
}
