
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.cmm.cmm9000.cmm9100.service.Cmm9100Service;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;



@Service("cmm9100Service")
public class Cmm9100ServiceImpl extends EgovAbstractServiceImpl implements Cmm9100Service {

    @Resource(name="cmm9100DAO")
    private Cmm9100DAO cmm9100DAO;
    
    
    @SuppressWarnings("rawtypes")
    public List selectCmm9100MultiCommonCodeList(Map param) throws Exception {
    	return cmm9100DAO.selectCmm9100MultiCommonCodeList(param); 
    }
}
