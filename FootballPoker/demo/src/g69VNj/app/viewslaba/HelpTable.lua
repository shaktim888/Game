
-- local HelpCell  = import(".HelpCell")
-- local HelpTable = class("HelpTable",BaseTable)



-- function HelpTable:setViewData()

--     local pathList = { "image/help/" }
--     local placeholder = "placeholder"
--     self._viewData = {
--         { placeholder, 12,6,3 },
--         { placeholder, 10,5,3 },
--         { placeholder, 10,4,3 },
--         { placeholder, 4,2,2 },
--         { placeholder, 8,3,2 },
--         { placeholder, 4,2,1 },
--         { placeholder, 4,2,1 },
--         { placeholder, 3,2,1 },
--         { placeholder, 3,2,1 },
--     }

  
-- end


-- function HelpTable:cellSizeForTable(table,idx)
--     -- return 954, 53
--     return 53, 954
-- end


-- function HelpTable:tableCellAtIndex(table, idx)
--     local cell =  table:dequeueCell()
--     if nil == cell then
--         cell = cc.TableViewCell:new()
--     end
--     if cell.view == nil then
--         cell.view = HelpCell.new( self )
--         cell:addChild(cell.view)
--     end
--     local data = self._viewData[ idx + 1]
--     cell.view:loadDataUi( data,idx + 1 )
--     self._cellList[idx+1] = cell.view
--     return cell
-- end



-- return HelpTable