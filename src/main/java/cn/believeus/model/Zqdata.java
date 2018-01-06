package cn.believeus.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Zqdata entity. @author MyEclipse Persistence Tools
 */

@Table(name="zqdata")
@Entity
public class Zqdata implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -3416419788711416943L;

	@Id
	@Column(name = "id")
	private Integer id;

	@JoinColumn(name="fk_metaId")
	private Zqmeta zqmeta;

	private String title;
	private String content;
	private Date createtime;
	private Date edittime;

	// Constructors

	/** default constructor */
	public Zqdata() {
	}

	/** full constructor */
	public Zqdata(Zqmeta zqmeta, String title, String content,
			Date createtime, Date edittime) {
		this.zqmeta = zqmeta;
		this.title = title;
		this.content = content;
		this.createtime = createtime;
		this.edittime = edittime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Zqmeta getZqmeta() {
		return this.zqmeta;
	}

	public void setZqmeta(Zqmeta zqmeta) {
		this.zqmeta = zqmeta;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getEdittime() {
		return this.edittime;
	}

	public void setEdittime(Date edittime) {
		this.edittime = edittime;
	}

}