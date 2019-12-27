package com.cykj.stopcard.bean;

import java.util.List;

public class TreeNode {

	private int id;

	private int parentId;
	private boolean checked=false;
	private String title;
	private String url;
	private List<TreeNode> children;

	@Override
	public String toString()
	{
		return "TreeNode{" + "id=" + id + ", parentId=" + parentId + ", checked=" + checked + ", title='" + title + '\'' + ", url='" + url + '\'' + ", children=" + children + '}';
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getParentId()
	{
		return parentId;
	}

	public void setParentId(int parentId)
	{
		this.parentId = parentId;
	}

	public boolean isChecked()
	{
		return checked;
	}

	public void setChecked(boolean checked)
	{
		this.checked = checked;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public List<TreeNode> getChildren()
	{
		return children;
	}

	public void setChildren(List<TreeNode> children)
	{
		this.children = children;
	}
}
