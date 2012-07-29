using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
public class Roles
{
    private string _name;
    private string _id;
    private string _parentId;
    private string _imagePath;

    public string Name
    {
        get { return _name; }
        set { _name = value; }
    }


    public string ID
    {
        get { return _id; }
        set { _id = value; }
    }

    public string ParentID
    {
        get { return _parentId; }
        set { _parentId = value; }
    }

    public string ImagePath
    {
        get { return _imagePath; }
        set { _imagePath = value; }
    }

    public Roles(string id, string parentId, string name, string imgPath)
    {
        _id = id;
        _parentId = parentId;
        _name = name;
        _imagePath = imgPath;
    }

    public static List<Roles> GetRoles()
    {
        List<Roles> roles = new List<Roles>();

        roles.Add(new Roles("1", null, "President", "~/treeview/img/boss-icon.png"));
        roles.Add(new Roles("2", "1", "Vice President", "~/treeview/img/engineer-icon.png"));
        roles.Add(new Roles("3", "2", "CEO", "~/treeview/img/engineer-icon.png"));
        roles.Add(new Roles("4", "3", "Project Manager", "~/treeview/img/engineer-icon.png"));
        roles.Add(new Roles("5", "4", "Team Laeder 1", "~/treeview/img/engineer-icon.png"));
        roles.Add(new Roles("6", "5", "Engineer 1", "~/treeview/img/user-icon.png"));
        roles.Add(new Roles("7", "5", "Engineer 2", "~/treeview/img/user-icon.png"));
        roles.Add(new Roles("8", "4", "Team Leader 2", "~/treeview/img/engineer-icon.png"));
        roles.Add(new Roles("9", "8", "Engineer 1", "~/treeview/img/user-icon.png"));
        roles.Add(new Roles("10", "8", "Engineer 2", "~/treeview/img/user-icon.png"));

        return roles;
    }
}

