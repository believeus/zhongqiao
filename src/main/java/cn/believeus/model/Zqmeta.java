package cn.believeus.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.HashSet;
import java.util.Set;

/**
 * Zqmeta entity. @author MyEclipse Persistence Tools
 */

@Table(name="zqmeta")
@Entity
public class Zqmeta implements java.io.Serializable {

	private static final long serialVersionUID = -8434750202099624550L;
	@Id
	@Column(name = "id")
	private Integer id;
	private String name;
	private Integer parentId;
	private String imageUrl;
	//private Set zqdatas = new HashSet(0);

	// Constructors

	/** default constructor */
	public Zqmeta() {
	}

	/** full constructor */
	public Zqmeta(String name, Integer parentId, String imageUrl) {
		this.name = name;
		this.parentId = parentId;
		this.imageUrl = imageUrl;
//		this.zqdatas = zqdatas;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getImageUrl() {
		return this.imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

//	public Set getZqdatas() {
//		return this.zqdatas;
//	}

//	public void setZqdatas(Set zqdatas) {
//		this.zqdatas = zqdatas;
//	}

}