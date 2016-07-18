#!/usr/bin/env node
'use strict';

var path=require('path')
  , join=path.join
  , parse=path.parse
  , fs=require('fs')
  , mediadir='/media/music/'
  , playlist=process.argv[2]
  , destdir=process.argv[3]||'/mnt/usb/Music/'
  , copy=(orig,dest)=>{
        return new Promise((resolve,reject)=>{
            console.log(orig,'->',dest);
            var rd=fs.createReadStream(orig)
              , wr=fs.createWriteStream(dest)

            rd.on('error',(err)=>{
                reject(err);
            });

            wr.on('error',(err)=>{
                reject(err);
            });

            wr.on('close',(ex)=>{
                reject(ex);
            });

            rd.pipe(wr);
            resolve();
        });
    }
  , playlist_=parse(playlist)

fs.readFile(playlist,'utf8',(err,data)=>{
    var songs=data.split(/\n/)
      , list=[]

    for(var song of songs){
        if(song!=''){
            var orig=join(mediadir,song)
              , orig_=parse(orig)
              , dest=join(destdir,playlist_.name,orig_.base)

            list.push(copy(orig,dest));
        }
    }

    Promise.all(list).then((values)=>{
        console.log('ok');
    });
});

