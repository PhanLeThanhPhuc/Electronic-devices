<%@ page pageEncoding="utf-8"%>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<section class="content">
	<div class="container-fluid">
		<div class="p-5 col-sm-9 m-auto"
			style="box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px; border-radius: 20px;">
			<form action="/admin/save-category" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-sm-6">
						<div class="mb-3">
							<label class="form-label">Category name</label> <input name="name"
								style="border: 2px solid rgb(102, 102, 233); border-radius: 0px;"
								type="text" class="form-control">
						</div>
					</div>
					<div class="col-sm-6">
					 <input type="hidden" name ="img"value="img">
						<div class="mb-3">
							<label for="formFileMultiple" class="form-label">Multiple
								files input example</label> <input class="form-control" name="image" type="file"
								id="formFileMultiple" multiple>
						</div>
					</div>
						</div>
					<button type="submit" style="border-radius: 0px;"
						class="btn btn-primary">Insert</button>
					<button type="submit" style="border-radius: 0px;"
						class="btn btn-primary">Update</button>
					<button type="submit" style="border-radius: 0px;"
						class="btn btn-primary">Delete</button>
					<button type="submit" style="border-radius: 0px;"
						class="btn btn-primary">Clear</button>
			</form>
		</div>
	</div>
</section>