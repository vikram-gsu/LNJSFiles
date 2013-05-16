
/*
 * GET home page.
 */
var fs = require('fs');

exports.index = function(req, res){
  res.render('index', { title: 'Express' });
};

exports.readFile = function(req, res){
	fs.exists('testFunc.txt',function(fileok){
		if(fileok)
		{
			fs.readFile('testFunc.txt', 'utf8', function(err, data){
				if(err){
					console.log(err);
				}

				var splitData = data.split('\n');
				
				var braceCounter =0;
				var appendString ='';
				for(var i=0;i<splitData.length; i++)
				{
					
					var line = splitData[i];
					var regex = /(void|int|char|float|double|bool)[\s]+([A-Za-z][A-Za-z0-9]*)[\s]+(([\(])(((void|int|char|float|double|bool)[\s]+([A-Za-z][A-Za-z0-9]*([,\s]*)))*)([\)]))/g;
					var matchedStr = line.match(regex);
					var regexMatch = regex.exec(line);
					var match = new String(matchedStr);

					if(matchedStr)
					{
						braceCounter = 0;
						console.log(RegExp.$2);
						appendString = appendString + match;

					}
					//console.log(data.indexOf(match));
					braceCounter += line.split('{').length-1;
										braceCounter -= line.split('}').length-1;

					// console.log(line);
					// console.log(braceCounter);
					if(braceCounter!=0)
					{
						appendString = appendString + line;
					}else if(!matchedStr)
					{

						console.log(appendString);	
					}

						
					
				}
			});
			
		}
		else
			console.log('couldnt find the file');
	});
};