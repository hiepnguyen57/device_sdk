#include <glog/logging.h>
#include <iostream>
#include <thread>

static const size_t kNumberOfThreadCreated = 5;
static const size_t kNumberOfLogsPeerThreads = 10;

class ThreadManager {
public:
    ThreadManager();
    ~ThreadManager();

    void CreateThread(size_t number);
    static void JobTask(size_t assigned_number);

private:
    std::thread thread_obj_;
    size_t thread_number_;
};

ThreadManager::ThreadManager() : thread_number_(-1) {
}

ThreadManager::~ThreadManager() {
    if (thread_obj_.joinable()) {
        thread_obj_.join();
    }
}

void ThreadManager::CreateThread(size_t number) {
    thread_obj_ = std::thread(JobTask, number);
}

void ThreadManager::JobTask(size_t assigned_number) {
    for (size_t i = 0; i < kNumberOfLogsPeerThreads; i++) {
        LOG(INFO) << "Thread created: " << assigned_number << " - Log number " << i;
    }
}

int main(int argc, char* argv[]) {
    // Initialize Google’s ogging library.
    google::InitGoogleLogging(argv[0]);

    FLAGS_logtostderr = 1;
    LOG(INFO) << "Starting ...";

    // Initialize Threads
    ThreadManager thread_list[kNumberOfThreadCreated];

    for (size_t i = 0; i < kNumberOfThreadCreated; i++) {
        thread_list[i].CreateThread(i);
    }

    LOG(INFO) << "End Program";
}