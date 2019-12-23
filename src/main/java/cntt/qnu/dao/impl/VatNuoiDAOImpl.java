package cntt.qnu.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import cntt.qnu.dao.VatNuoiDAO;
import cntt.qnu.entity.VatNuoi;
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
		List<VatNuoiInfo> list= query.list()	;
	
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
}
