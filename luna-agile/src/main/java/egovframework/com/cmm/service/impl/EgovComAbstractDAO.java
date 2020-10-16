
package egovframework.com.cmm.service.impl;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import javax.annotation.Resource;

import com.ibatis.sqlmap.client.SqlMapClient;


public abstract class EgovComAbstractDAO extends EgovAbstractDAO{

	@Resource(name="lunaops.sqlMapClient")
	public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
        super.setSuperSqlMapClient(sqlMapClient);
    }


}
