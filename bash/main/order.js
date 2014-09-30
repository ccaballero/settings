#!/usr/bin/env node
'use strict';

var path=require('path')
  , fs=require('fs')
  , dirpath=process.argv[2]||'.'
  , digits=+(process.argv[3])||2
  , ext=process.argv[4]
  , local=path.resolve(dirpath)
  , pad=function(n,len){
        return (new Array(len+1).join('0')+n).slice(-len)
    }

fs.exists(local,function(exists){
    if(!exists){
        console.log('Path not found!!');
    }else{
        fs.readdir(local,function(err,files){
            files.sort();
            for(var i=0; i<files.length; i++){
                var old_path=path.resolve(local,
                             files[i])
                  , new_path=path.resolve(local,
                             pad((i+1),digits)+(ext||path.extname(old_path)))
                console.log(old_path);
                console.log(new_path);
                console.log();
                fs.rename(old_path,new_path,function(err){
                    if(err){
                        console.log('ERROR: '+err);
                    }
                });
            }
        });
    }
});

