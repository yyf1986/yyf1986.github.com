```
function shanchu(project_name,upstream_group_name,node_ip,node_port,node_status){
	$.ajax({
		type: "POST",
		url: "/v1/upstream",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify({
			"project_name": project_name,
			"upstream_group_name": upstream_group_name,
			"node_ip": node_ip,
			"node_port": node_port,
			"node_status": 3
		}),
		dataType: "json",
		success: function (message) {
			alert(message);            
			//$("#resultid").html(JSON.stringify(message))
		},
		error: function (message) {
			alert(message);
		}
	});
}
```

```
function del(ip,id){
	$.get("http://10.11.20.127:12346/v1/container/del", {
		"vm_ip" : ip,
		"container_id": id
	}, function(msg) {
		alert(JSON.stringify(msg));
		location.reload()
	}).error(function() {
		alert("请求失败！");
	});
}
```
```
<a class="btn btn-warning" href="javascript:void(0)" onclick="shanchu('{{d.project_name}}','{{d.upstream_group_name}}','{{d.node_ip}}','{{d.node_port}}',3)">删除</a>
```

###
```
$(function(){
	$("#push").click(function(){
		var project_name = $("#project_name").val();
		$.get("/v1/upstream/push", {
			"project_name" : project_name
		}, function(msg) {
			//alert(msg);
			$("#resultid").html(JSON.stringify(msg))
		}).error(function() {
			alert("请求失败！");
		});
	});
});
<input type="button" class="form-control" id="push" value="推送">
```

```
$("#submit").click(function() {
	$.ajax({
		type: "POST",
		url: "/v1/upstream",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify({
			"project_name": $("#project_name").val(),
			"upstream_group_name": $("#upstream_group_name").val(),
			"node_ip": $("#node_ip").val(),
			"node_port": $("#node_port").val(),
			"node_status": $("#node_status").val()
		}),
		dataType: "json",
		success: function (message) {
			//alert(message);            
			$("#resultid").html(JSON.stringify(message))
		},
		error: function (message) {
			alert(JSON.stringify(message));
		}
	});
});
<input type="button" class="form-control" id="submit" value="提交">
```
