package dao;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


public interface TypeDao {
	@Select(" select * from type where pid = #{pid}")
	public List<Map<String, Object>> selectAll(@Param("pid") int pid);
}
