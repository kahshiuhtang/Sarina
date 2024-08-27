//
//  TaskListView.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 8/26/24.
//

import SwiftUI

struct TaskListView: View {
    
    @State private var tasks: [UserTask] = []
    var body: some View {
        NavigationView{
            List(MockUserTasksData.userTasks){ userTask in
                TaskListCell(userTask: userTask)
            }.navigationTitle("Tasks")
        }
    }
}
struct TaskListCell: View {
    let userTask: UserTask
    
    var body: some View{
        HStack{
            Image("db2").resizable().aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5){
                Text(userTask.title)
                    .font(.title2)
                    .fontWeight(.medium)
                Text(userTask.description)
                    .foregroundColor(.secondary)
                    .font(.title2)
                    .fontWeight(.medium)
            }
            .padding(.leading)
        }
    }
}
#Preview {
    TaskListView()
}
