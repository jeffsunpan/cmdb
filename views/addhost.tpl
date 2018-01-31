%rebase base title='添加主机',position='添加项目'
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="widget">
                <div class="widget-header bordered-bottom bordered-themesecondary">
                    <i class="widget-icon fa fa-tags themesecondary"></i>
                    <span class="widget-caption themesecondary">添加主机</span>
                    <div class="widget-buttons">
                        <a href="#" data-toggle="maximize">
                            <i class="fa fa-expand"></i>
                        </a>
                        <a href="#" data-toggle="collapse">
                            <i class="fa fa-minus"></i>
                        </a>
                        <a href="#" data-toggle="dispose">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                    
                </div><!--Widget Header-->
                <div style="padding:-10px 0px;" class="widget-body no-padding">
                  <form action="" method="post">
                    <div class="modal-body">
                        <div class="input-group">
                            <span class="input-group-addon">主机IP</span>
                            <input type="text" style="width:500px" class="form-control" id="" name="ip" aria-describedby="inputGroupSuccess4Status" value="{{info.get('ip','')}}">
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="input-group">
                            <span class="input-group-addon">端口</span>
                            <input type="text" style="width:500px" class="form-control" id="" name="port" aria-describedby="inputGroupSuccess4Status" value="{{info.get('port','')}}">
                        </div>
                    </div>

                    <div class="modal-body">
                        <div class="input-group">
                            <span class="input-group-addon">备注</span>
                            <input type="text" style="width:500px" class="form-control" id="" name="remark" aria-describedby="inputGroupSuccess4Status" value="{{info.get('port','')}}">
                        </div>
                    </div>

                    <div class="input-group col-lg-4 col-md-4 col-md-offset-1 pull-left" style="padding:5px 0;margin-left:1.88%;">
                        <span class="input-group-addon">项目</span>
                        <select class="form-control" name="name" id="assist">
                            <option value="-1">-- 请指定项目 --</option>
                            <option value="0">不指定</option>
                            <option value="" disabled>------ 指定项目 ------</option>
                            %for item in item_data:
                                <option id="{{item.get('id','')}}" value="{{item.get('name','')}}">{{item.get('name','')}}</option>
                            %end
                        </select>
                    </div>


                    <div class="modal-footer">
                        <button type="submit" style="float:left" class="btn btn-primary">提交</button>
                    </div>
                </div>
              </form>
            </div>
        </div>
    </div>
</div>
<script src="/assets/js/datetime/bootstrap-datepicker.js"></script> 
<script charset="utf-8" src="/assets/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/assets/kindeditor/lang/zh_CN.js"></script>
<script>
    $('.date-picker').datepicker();     //时间插件
    KindEditor.ready(function(K) {
            window.editor = K.create('#editor_id');
    });
</script>
