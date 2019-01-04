pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

bronze={4,9,7}
silver={13,6,7}
gold={9,10,7}
pal=gold

function make(x,y)
	local s={}
	local speed=rnd(1)
	
	s.x=x
	s.y=y
	s.t=0
	//pal=gold
	//s.c=pal[flr(rnd(3))+1]
	s.c = pal[3]
	s.max_t=2+rnd(5)
	s.dx=speed * cos(rnd(1))
	s.dy=speed * sin(rnd(1))
	s.ddy=0.1
	add(smoke,s)
	return s
end
	
function _init()
	smoke={}
	cls()	
end

function c()
	make(64,64)	
end

function move(s)
	if(s.t > s.max_t) then
	//if s.t >1 and rnd(100) < 1 then
		del(smoke,s)
	end
	s.x+=s.dx
	s.y+=s.dy
	s.dy=s.dy+s.ddy
	if s.y > 127 then
		//s.ddy=-0.1
		s.y=127
	end
	
	s.t+=1/s.max_t
	if s.t > s.max_t/3 then
		s.c = pal[2]
	end
	if s.t > 2*(s.max_t/3) then
		s.c = pal[1]
	end
	//s.t+=0.01
end

function draw_smoke(s)
	//circfill(s.x,s.y,2,7)
	pset(s.x,s.y,s.c)
end

function _update()
	for x=0,10 do
		c()
	end
	foreach(smoke,move)
 //if btn(5) then c() end
end

function _draw()
	cls()
	foreach(smoke, draw_smoke)
	
end
