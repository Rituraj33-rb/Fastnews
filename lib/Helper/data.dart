import 'package:news/models/catagory_model.dart';

List<CatagoryModel>getCategories(){
  List<CatagoryModel>category=new List<CatagoryModel>();
  CatagoryModel catagoryModel=new CatagoryModel();

//1
  catagoryModel.catagoryName="Technology";
  catagoryModel.imageUrl="https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(catagoryModel);
  catagoryModel=new CatagoryModel();

  //2
  catagoryModel.catagoryName="Business";
  catagoryModel.imageUrl="https://images.unsplash.com/photo-1590283603385-17ffb3a7f29f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(catagoryModel);
  catagoryModel=new CatagoryModel();

  //3
  catagoryModel.catagoryName="Entertainment";
  catagoryModel.imageUrl="https://images.unsplash.com/photo-1594908900066-3f47337549d8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(catagoryModel);
  catagoryModel=new CatagoryModel();

  //4

  catagoryModel.catagoryName="Health";
  catagoryModel.imageUrl="https://images.unsplash.com/photo-1576091160550-2173dba999ef?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(catagoryModel);
  catagoryModel=new CatagoryModel();

  //5

  catagoryModel.catagoryName="Science";
  catagoryModel.imageUrl="https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  category.add(catagoryModel);
  catagoryModel=new CatagoryModel();

  //6

  catagoryModel.catagoryName="Sports";
  catagoryModel.imageUrl="https://images.unsplash.com/photo-1471295253337-3ceaaedca402?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1048&q=80";
  category.add(catagoryModel);
  catagoryModel=new CatagoryModel();

  //7

  catagoryModel.catagoryName="General";
  catagoryModel.imageUrl="https://images.unsplash.com/photo-1572949645841-094f3a9c4c94?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
  category.add(catagoryModel);
  catagoryModel=new CatagoryModel();

  return category;
}

