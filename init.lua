math.randomseed(os.time())

default.chest_formspec =
	"size[8,9]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;main;3.5,1;1,1;]"..
	"list[current_player;main;0,2.85;8,1;]"..
	"list[current_player;main;0,4.08;8,3;8]"..
	default.get_hotbar_bg(0,2.85)

minetest.register_node("knothole:default_tree_knothole",
	table.copy(minetest.registered_nodes["default:tree"])
)

minetest.override_item("knothole:default_tree_knothole", {
	description = "Log With Knothole",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",default.chest_formspec)
		meta:set_string("infotext", "Knothole")
		local inv = meta:get_inventory()
		inv:set_size("main", 1*1)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" shuffles the order of the items in knothole at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" hides stuff in knothole at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from knothole at "..minetest.pos_to_string(pos))
	end,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5000, -0.5000, -0.5000, 0.5000, -0.3750, 0.5000},
			{-0.5000, -0.5000, -0.5000, -0.3750, 0.5000, 0.5000},
			{-0.5000, -0.5000, -0.5000, 0.5000, 0.5000, -0.3750},
			{-0.5000, 0.3750, -0.5000, 0.5000, 0.5000, 0.5000},
			{0.3750, -0.5000, -0.5000, 0.5000, 0.5000, 0.5000},
			{0.1250, -0.3750, 0.5000, 0.3750, 0.3750, 0.6250},
			{-0.3750, -0.3750, 0.5000, -0.1250, 0.3750, 0.6250},
			{-0.3750, 0.1250, 0.5000, 0.3750, 0.3750, 0.6250},
			{-0.3750, -0.3750, 0.5000, 0.3750, -0.1250, 0.6250}
		},
	},
	-- node_box = {
	-- 	type = "fixed",
	-- 	fixed = {
	-- 		{-0.5000, -0.5000, -0.5000, 0.5000, -0.3750, 0.5000},
	-- 		{-0.5000, -0.5000, -0.5000, -0.3750, 0.5000, 0.5000},
	-- 		{-0.5000, -0.5000, -0.5000, 0.5000, 0.5000, -0.3750},
	-- 		{-0.5000, 0.3750, -0.5000, 0.5000, 0.5000, 0.5000},
	-- 		{-0.5000, -0.5000, 0.3750, 0.5000, 0.5000, 0.5000},
	-- 		{0.5000, -0.3750, -0.3750, 0.6250, 0.3750, -0.1250},
	-- 		{0.5000, -0.3750, 0.1250, 0.6250, 0.3750, 0.3750},
	-- 		{0.5000, 0.1250, -0.3750, 0.6250, 0.3750, 0.3750},
	-- 		{0.5000, -0.3750, -0.3750, 0.6250, -0.1250, 0.3750}
	-- 	},
	-- },
	-- Bigger hole
	-- node_box = {
	-- 	type = "fixed",
	-- 	fixed = {
	-- 		{-0.5000, -0.5000, -0.5000, 0.5000, -0.3750, 0.5000},
	-- 		{-0.5000, -0.5000, -0.5000, -0.3750, 0.5000, 0.5000},
	-- 		{-0.5000, -0.5000, -0.5000, 0.5000, 0.5000, -0.3750},
	-- 		{-0.5000, 0.3750, -0.5000, 0.5000, 0.5000, 0.5000},
	-- 		{-0.5000, -0.5000, 0.3750, 0.5000, 0.5000, 0.5000},
	-- 		{0.5000, -0.3750, -0.3750, 0.6250, 0.3750, -0.2500},
	-- 		{0.5000, -0.3750, 0.2500, 0.6250, 0.3750, 0.3750},
	-- 		{0.5000, 0.2500, -0.3750, 0.6250, 0.3750, 0.3750},
	-- 		{0.5000, -0.3750, -0.3750, 0.6250, -0.2500, 0.3750}
	-- 	}
	-- },
-- Shallower ring
-- 	node_box = {
-- 	type = "fixed",
-- 	fixed = {
-- 		{-0.5000, -0.5000, -0.5000, 0.5000, -0.3750, 0.5000},
-- 		{-0.5000, -0.5000, -0.5000, -0.3750, 0.5000, 0.5000},
-- 		{-0.5000, -0.5000, -0.5000, 0.5000, 0.5000, -0.3750},
-- 		{-0.5000, 0.3750, -0.5000, 0.5000, 0.5000, 0.5000},
-- 		{-0.5000, -0.5000, 0.3750, 0.5000, 0.5000, 0.5000},
-- 		{0.5000, -0.3750, -0.3750, 0.6250, 0.3750, -0.1250},
-- 		{0.5000, -0.3750, 0.1250, 0.6250, 0.3750, 0.3750},
-- 		{0.5000, 0.1250, -0.3750, 0.6250, 0.3750, 0.3750},
-- 		{0.5000, -0.3750, -0.3750, 0.6250, -0.1250, 0.3750}
-- 	}
-- }
	selectionbox = {type="regular"},
})

-- minetest.register_abm({
-- 	nodenames = {"default:tree"},
-- 	interval = 10,
-- 	chance = 2,
-- 	action = function(pos, node)
-- 		pos.y = pos.y-2
-- 		local name = minetest.get_node(pos).name
-- 		if name == "default:tree" then
-- 			if minetest.find_node_near(pos, 3, {"default:tree", "group:water"}) ~= nil then
-- 				minetest.set_node(pos, {name="knothole:default_tree_knothole"})
-- 			end
-- 			end
-- 		end
-- })
--
-- minetest.register_abm({
-- 	nodenames = {"knothole:default_tree_knothole"},
-- 	interval = 500,
-- 	chance = 20,
-- 	action = function(pos, node)
-- 		minetest.set_node(pos, {name="default:tree"})
-- 	end
-- })

minetest.register_lbm({
	name = "knothole:default_tree_knothole",
	nodenames = {"default:meselamp"},
	run_at_every_load = true,
	action = function(pos, node)
		if math.random(20) == 1 then
			local surroundings = minetest.find_node_near(pos, 3, {"default:tree", "group:water"})
			local root = minetest.get_node_or_nil({x=pos.x,y=pos.y-2,z=pos.z})
			local ground = minetest.get_node_or_nil({x=pos.x,y=pos.y-3,z=pos.z})
			if surroundings
			and root ~= nil
			and root.name == "default:tree"
			and ground.name ~= "default:tree" then
				minetest.set_node(pos, { name = "knothole:default_tree_knothole" })
			end
		end
	end,
})

-- -- Get content IDs during load time, and store into a local
-- local c_dirt  = minetest.get_content_id("default:dirt")
-- local c_grass = minetest.get_content_id("default:dirt_with_grass")
--
-- local function grass_to_dirt(pos1, pos2)
--     -- Read data into LVM
--     local vm = minetest.get_voxel_manip()
--     local emin, emax = vm:read_from_map(pos1, pos2)
--     local a = VoxelArea:new{
--         MinEdge = emin,
--         MaxEdge = emax
--     }
--     local data = vm:get_data()
--
--     -- Modify data
--     for z = pos1.z, pos2.z do
--         for y = pos1.y, pos2.y do
--             for x = pos1.x, pos2.x do
--                 local vi = a:index(x, y, z)
--                 if data[vi] == c_grass then
--                     data[vi] = c_dirt
--                 end
--             end
--         end
--     end
--
--     -- Write data
--     vm:set_data(data)
--     vm:write_to_map(true)
-- end

minetest.register_craft({
	output = 'default:wood 3',
	recipe = {
		{'knothole:default_tree_knothole'},
	}
})
